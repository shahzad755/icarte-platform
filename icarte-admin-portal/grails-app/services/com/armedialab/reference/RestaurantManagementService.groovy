package com.armedialab.reference

import grails.transaction.Transactional

import java.awt.image.BufferedImage
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

import javax.imageio.ImageIO

import org.imgscalr.Scalr

import com.armedialab.entity.AccountType
import com.armedialab.entity.Branch;
import com.armedialab.entity.Orders
import com.armedialab.entity.Restaurant
import com.armedialab.entity.RestaurantDevice
import com.armedialab.user.User
import com.armedialab.util.IDUtils
import com.armedialab.util.Utils

@Transactional
class RestaurantManagementService {

	def grailsApplication
	def springSecurityService
	
	public RestaurantDevice saveRestaurantDevice(def data) {
		RestaurantDevice rdInstance = null
		def username = springSecurityService.principal.username
		// Edit Mode
		if(data.id) {
			if(log.isDebugEnabled())
				log.debug("Entering RestaurantDevice Edit Mode: with id ${data.id}")

			rdInstance = RestaurantDevice.get(data.id.toLong())
			if(rdInstance) {
				rdInstance.properties["deviceId", "deviceManufecturer", "applicationMode", "servingTable", "isCustContactMandatory", "branch", "isBlocked", "isActive", "version"] = data
				rdInstance.updatedBy = username
			}
		} else {
			if(log.isDebugEnabled())
				log.debug("Entering RestaurantDevice New Instance Mode")
			rdInstance = new RestaurantDevice()
			rdInstance.properties["deviceId", "deviceManufecturer", "applicationMode", "servingTable", "isCustContactMandatory", "branch", "isBlocked", "isActive", "version"] = data
			rdInstance.registrationCode = generateDeviceRegNumber()
			rdInstance.restaurant = Branch.get(rdInstance.branch?.id)?.restaurant
			rdInstance.createdBy = username
		}
		
		if(rdInstance.isBlocked) {
			rdInstance.blockedBy = username
		}
		if(rdInstance.applicationMode!=1 && !rdInstance.servingTable) {
			rdInstance.errors.rejectValue("servingTable", "error.servingTable.null")
		}
		rdInstance.errors.addAllErrors(data.errors)
		
		if( !rdInstance.hasErrors() && rdInstance.validate() && (!rdInstance.id && validateRestaurantDeviceSubscription(rdInstance))) {
			if(log.isDebugEnabled())
				log.debug("RestaurantDevice validation successfull! Saving record...")
			
			rdInstance.save(flush: true)
		} else {
			//userInstance.discard()
			if(log.isDebugEnabled())
				log.debug("Restaurant Device validation Failed!")
		}
		return rdInstance
	}
	
	public boolean validateRestaurantDeviceSubscription(RestaurantDevice device) {
		if(log.isDebugEnabled())
			log.debug("Validating Restaurant Device for device subscription account quota!")

		Boolean isValid = false
		Restaurant restaurant = device?.restaurant
		AccountType accType = restaurant?.accountType
		if(accType) {
			int currentTotalDeviceCount = RestaurantDevice.countByRestaurantAndIsActive(restaurant, true)
			//null or zero means there's no limit
			if(accType.deviceNumAllowed && currentTotalDeviceCount < accType.deviceNumAllowed) {
				isValid = true
			} else {
				device.errors.reject("max.device.quota.reached", 
						[(accType.deviceNumAllowed as String), accType.name].toArray(), 
						"You have already consumed your maximum allowed device quota, i.e. '${accType.deviceNumAllowed as String}' for your subscribed package, i.e. '${accType.name}'. Please contact administrator to upgrade your subscription.")
				log.warn("Restaurant Device creation failed due to excess usage! Data[Restaurant: ${restaurant.id}, Device: ${device.deviceId}, Attempted By: ${springSecurityService.loadCurrentUser().username}]")
			}
		}

		return isValid
	}
	
	def generateDeviceRegNumber() {
		def notGenerated = true
		def refNum
		while(notGenerated) {
			refNum = new IDUtils().generateID()
			if(RestaurantDevice.executeQuery("SELECT 1 from RestaurantDevice dr WHERE dr.registrationCode = ?", refNum).empty)
				notGenerated = false
			else
				log.warn("Collision detected while generating device registration code!!! Retrying...")
		}
		return notGenerated? null: refNum
	}

	def loadImages(def data) {
		def config = grailsApplication.config
		def result = []
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"
		if(data.id) {
			Restaurant restaurant = Restaurant.get(data.id)
			if(restaurant.bgImage) {
				//load the bgImage
				Path bgImagePath = Paths.get(new StringBuilder(getAbsolutePath(restaurant, config))
					.append(File.separator)
					.append(restaurant.bgImage).toString())
				
				if(log.isDebugEnabled())
					log.debug "Path: ${bgImagePath}"
					
				if(Files.exists(bgImagePath)) {
					log.debug "Path: file exists"
					String path = "${config.imageRemoteURL}/${getPath(restaurant, config)}"
					//load the file
					result = [
						name: restaurant.bgImage,
						originalName: restaurant.originalBgImage,
						size: Files.size(bgImagePath),
						url: "${path}/${restaurant.bgImage}",
						thumbnailUrl: "${path}/${restaurant.bgImageThumbnail}",
						deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${restaurant.id}",
						deleteType: "DELETE"
					]
				}
			}			
		}
		if(log.debugEnabled)
			log.debug "Returning result ${result}"

		return result
	}
	
	def saveImage(def data, def file) {
		def config = grailsApplication.config
		def result = []
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"

		/* 
		 * 1- Create a folder if doesn't exist for restaurantImageFolder
		 * 2- Create a folder if doesn't exist with restaurant ID in (This can be done at the time of
		 * restaurant creation) global 
		 * 3- Create a folder if doesn't exist for restaurantBgImageFolder
		 * 4- Create the file with unique name
		 */
		
		if(data.id) {
			Restaurant restaurant = Restaurant.get(data.id)
			//load the image
			Path dir = Paths.get(getAbsolutePath(restaurant, config))
			if(log.isDebugEnabled())
				log.debug "Path to images directory: ${dir}"
			
			if(!Files.exists(dir)) {
				log.debug "Images directory does not exist, creating new hierarchy for path: ${dir}"
				dir = Files.createDirectories(dir)
			}
			
			String newFilenameBase = UUID.randomUUID().toString()
			String originalFileExtension = file.originalFilename.substring(
				file.originalFilename.lastIndexOf("."))
			String newFilename = newFilenameBase + originalFileExtension
			File newFile = new File("${dir}/${newFilename}")
			file.transferTo(newFile)
			
			if(log.debugEnabled) {
				log.debug "File: ${dir}/${newFilename} created, now setting correct permissions.."
			}
			//Setting permissions
			Utils.updatePermissions(newFile, config.apacheGroupName)
			
			BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), 56, 56);
			String thumbnailFilename = newFilenameBase + '-thumbnail.png'
            File thumbnailFile = new File("${dir}/${thumbnailFilename}")
            ImageIO.write(thumbnail, 'png', thumbnailFile)
			thumbnail.flush()

			if(log.debugEnabled)
				log.debug "Thumbnail: ${dir}/${thumbnailFilename} created.."
			//Setting permissions
			Utils.updatePermissions(thumbnailFile, config.apacheGroupName)

			//Update the Restaurant
			restaurant.bgImage = newFilename
			restaurant.originalBgImage = file.originalFilename
			restaurant.bgImageThumbnail = thumbnailFilename
			restaurant.save(flush: true)
			
			if(log.debugEnabled)
				log.debug "Updating Restaurant(${restaurant.id})"
				
			String path = "${config.imageRemoteURL}/${getPath(restaurant, config)}"
			
			result = [
					name: restaurant.bgImage,
					originalName: restaurant.originalBgImage,
					size: file.size,
					url: "${path}/${restaurant.bgImage}",
					thumbnailUrl: "${path}/${restaurant.bgImageThumbnail}",
					deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${restaurant.id}",
					deleteType: "DELETE"
			]
		}
		if(log.debugEnabled)
			log.debug "Returning result ${result}"
		return result
	}

	def deleteImage(data){
		def config = grailsApplication.config
		def result = []
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"

		if(data.id) {
			Restaurant restaurant = Restaurant.get(data.id)
			//load the image
			Path dir = Paths.get(getAbsolutePath(restaurant, config))
			if(log.isDebugEnabled())
				log.debug "Path to restaurant Images: ${dir}"
			
			if(Files.exists(dir)) {
				if(log.isDebugEnabled())
					log.debug "Image exist, deleting image: ${dir}/${restaurant.bgImage}"
				File picFile = new File("${dir}/${restaurant.bgImage}")
				picFile.delete()
				File thumbnailFile = new File("${dir}/${restaurant.bgImageThumbnail}")
				thumbnailFile.delete()
				//Update the restaurant
				restaurant.bgImage = null
				restaurant.originalBgImage = null
				restaurant.bgImageThumbnail = null
				restaurant.save(flush: true)
				
				if(log.debugEnabled)
					log.debug "Updating Restaurant (${restaurant.id})"
			}
		}
	}
	
	//image path strategy is: globalImagePath/restaurantImageFolder/${restaurantId}/restaurantBgImageFolder/<IMAGES>
	
	public def getAbsolutePath(def restaurant, def config) {
		return new StringBuilder(config.globalImagePath)
		.append(File.separator)
		.append(getPath(restaurant, config))
		.toString()
	}
	
	public def getPath(def restaurant, def config) {
		return new StringBuilder(config.restaurantImageFolder)
		.append(Utils.PATH_SEPARATOR)
		.append(restaurant.id)
		.append(Utils.PATH_SEPARATOR)
		.append(config.restaurantBgImageFolder)
		.toString()
	}

}
