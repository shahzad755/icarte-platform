package com.armedialab.reference

import grails.transaction.Transactional

import java.awt.image.BufferedImage
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

import javax.imageio.ImageIO

import org.imgscalr.Scalr

import com.armedialab.entity.CuisineType
import com.armedialab.util.Utils

@Transactional
class CuisineTypeManagementService {

	def grailsApplication
	
	def loadImages(def data) {
		def config = grailsApplication.config
		def result = []
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"
		if(data.id) {
			CuisineType cuisineType = CuisineType.get(data.id)
			if(cuisineType.imageUrl) {
				//load the bgImage
				Path imagePath = Paths.get(new StringBuilder(getAbsolutePath(cuisineType, config))
					.append(File.separator)
					.append(cuisineType.imageUrl).toString())
				
				if(log.isDebugEnabled())
					log.debug "Path: ${imagePath}"
					
				if(Files.exists(imagePath)) {
					log.debug "Path: file exists"
					String path = "${config.imageRemoteURL}/${getPath(cuisineType, config)}"
					//load the file
					result = [
						name: cuisineType.imageUrl,
						originalName: cuisineType.originalImageName,
						size: Files.size(imagePath),
						url: "${path}/${cuisineType.imageUrl}",
						thumbnailUrl: "${path}/${cuisineType.smallIconUrl}",
						deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${cuisineType.id}",
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
		 * 1- Create a folder if doesn't exist for cuisineTypeImageFolder
		 * 2- Create a folder if doesn't exist with restaurant ID in (This can be done at the time of
		 * restaurant creation) global 
		 * 3- Create the file with unique name
		 */
		
		if(data.id) {
			CuisineType cuisineType = CuisineType.get(data.id)
			//load the image
			Path dir = Paths.get(getAbsolutePath(cuisineType, config))
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
	
			//Update the CuisineType
			cuisineType.imageUrl = newFilename
			cuisineType.originalImageName= file.originalFilename
			cuisineType.smallIconUrl = thumbnailFilename
			cuisineType.save(flush: true)
			
			if(log.debugEnabled)
				log.debug "Updating Restaurant(${cuisineType.id})"
				
			String path = "${config.imageRemoteURL}/${getPath(cuisineType, config)}"
			
			result = [
					name: cuisineType.imageUrl,
					originalName: cuisineType.originalImageName,
					size: file.size,
					url: "${path}/${cuisineType.imageUrl}",
					thumbnailUrl: "${path}/${cuisineType.smallIconUrl}",
					deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${cuisineType.id}",
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
			CuisineType cuisineType = CuisineType.get(data.id)
			//load the image
			Path dirCategory = Paths.get(getAbsolutePath(cuisineType, config))
			if(log.isDebugEnabled())
				log.debug "Path to Cuisine Type Images: ${dirCategory}"
			
			if(Files.exists(dirCategory)) {
				if(log.isDebugEnabled())
					log.debug "Image exist, deleting image: ${dirCategory}/${cuisineType.imageUrl}"
				File picFile = new File("${dirCategory}/${cuisineType.imageUrl}")
				picFile.delete()
				File thumbnailFile = new File("${dirCategory}/${cuisineType.smallIconUrl}")
				thumbnailFile.delete()
				//Update the restaurant
				cuisineType.imageUrl = null
				cuisineType.originalImageName = null
				cuisineType.smallIconUrl = null
				cuisineType.save(flush: true)
				
				if(log.debugEnabled)
					log.debug "Updating CuisineType (${cuisineType.id})"
			}
		}
	}
	
	//image path strategy is: globalImagePath/cuisineTypeImageFolder/${restaurantId}/<IMAGES>
	
	private def getAbsolutePath(def cuisineType, def config) {
		return new StringBuilder(config.globalImagePath)
		.append(File.separator)
		.append(getPath(cuisineType, config))
		.toString()
	}
	
	private def getPath(def cuisineType, def config) {
		return new StringBuilder(config.cuisineTypeImageFolder)
		.append(Utils.PATH_SEPARATOR)
		.append(cuisineType?.restaurant?.id)
		.append(Utils.PATH_SEPARATOR)
		.append(cuisineType?.id)
		.toString()
	}

}
