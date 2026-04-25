package com.armedialab

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

import java.awt.image.BufferedImage
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

import javax.imageio.ImageIO

import org.imgscalr.Scalr

import com.armedialab.entity.Addon
import com.armedialab.entity.Item
import com.armedialab.entity.ItemAddon
import com.armedialab.entity.ItemCategory
import com.armedialab.entity.ItemMediaContent
import com.armedialab.entity.ItemVariant
import com.armedialab.entity.ItemVariantTranslation
import com.armedialab.entity.RefLanguage
import com.armedialab.entity.Restaurant
import com.armedialab.entity.Staff
import com.armedialab.entity.Variant
import com.armedialab.entity.VideoSourceType
import com.armedialab.util.Constants
import com.armedialab.util.Utils

@Transactional
class ItemManagementService {
	def springSecurityService
	def grailsApplication
	
	
	def searchItem(def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for items with given search criteria:>${_criteria}")
		def criteria = Item.createCriteria()
		def user = springSecurityService.loadCurrentUser()
		
		def authority = springSecurityService.authentication.authorities.find {
			it.authority == "ROLE_SUPERADMIN"
		}
		def items = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			eq ("isDeleted", Boolean.FALSE)
			//allow only items which belongs to user's restaurant
			if(!authority){
				if(log.isDebugEnabled()) {
					log.debug("User is not admin, only allow restaurant related items")
				}
				restaurant {
					eq ("id", Staff.findByUser(user)?.restaurant.id)
				}
			}

			if(_criteria.data.searchCode) {
				like ("code", _criteria.data.searchCode.toUpperCase()+"%")
			}

			if(_criteria.data.searchMappingCode) {
				eq ("code", _criteria.data.searchMappingCode.toUpperCase())
			}

			if(_criteria.data.searchIsActive) {
				eq ("isActive", _criteria.data.searchIsActive.toBoolean())
			}
			if(_criteria.data.searchCategory) {
				itemCategory {
					eq ("id", _criteria.data.searchCategory as Long)
				}
			}
/*			if(_criteria.data.searchSpiceType) {
				spiceType {
					eq ("id", _criteria.data.searchSpiceType as Long)
				}
			}
			if(_criteria.data.searchCuisineType) {
				cuisineType {
					eq ("id", _criteria.data.searchCuisineType as Long)
				}
			}*/
			if(_criteria.data.searchTitle) {
				itemVariants {
					eq("isPrimary", true)
					and {
						itemVariantTranslations {
							eq("language.id", Constants.Languages.ENGLISH.getLanguagesId())
							and {
								ilike ("title", _criteria.data.searchTitle+"%")
							}
						}
					}
				}
			}
			//Handle Title as sorting column differently...
			if("title".equals(_criteria.sortColumn)){
				itemVariants {
					eq("isPrimary", true)
					and {
						itemVariantTranslations {
							eq("language.id", Constants.Languages.ENGLISH.getLanguagesId())
							order ("title", _criteria.sortOrder)
						}
					}
				}
			} else {
				order (_criteria.sortColumn, _criteria.sortOrder)
			}
			
			/*			
			def dateFormat = grailsApplication.config.search.dateFormat
			SimpleDateFormat sf = new SimpleDateFormat(dateFormat)
			
			//dateCreated
			if(_criteria.data.dateCreatedFrom && !_criteria.data.dateCreatedTo) {
				between ("dateCreated", sf.parse(_criteria.data.dateCreatedFrom), sf.parse(_criteria.data.dateCreatedFrom) + 10)
			}
			if(_criteria.data.dateCreatedTo && !_criteria.data.dateCreatedFrom) {
				between ("dateCreated", sf.parse(_criteria.data.dateCreatedTo) - 10, sf.parse(_criteria.data.dateCreatedTo))
			}
			if(_criteria.data.dateCreatedTo && _criteria.data.dateCreatedFrom) {
				between ("dateCreated", sf.parse(_criteria.data.dateCreatedFrom), sf.parse(_criteria.data.dateCreatedTo) + 1)//adding 1 to make "to date" inclusive
			}
			
			//submittedDate
			if(_criteria.data.lastUpdatedFrom && !_criteria.data.lastUpdatedTo) {
				between ("lastUpdated", sf.parse(_criteria.data.lastUpdatedFrom), sf.parse(_criteria.data.lastUpdatedFrom) + 10)
			}
			if(_criteria.data.lastUpdatedTo && !_criteria.data.lastUpdatedFrom) {
				between ("lastUpdated", sf.parse(_criteria.data.lastUpdatedTo) - 10, sf.parse(_criteria.data.lastUpdatedTo))
			}
			if(_criteria.data.lastUpdatedTo && _criteria.data.lastUpdatedFrom) {
				between ("lastUpdated", sf.parse(_criteria.data.lastUpdatedFrom), sf.parse(_criteria.data.lastUpdatedTo) + 1)//adding 1 to make "to date" inclusive
			}

			*/
		}
		def results = items.collect {
			[DT_RowId: "${it.id}",
				code: "${it.code?:'-'}",
				title: "${it.primaryVariant?.defaultTitle?:'-'}",
				price: "${it.primaryVariant?.price}",
				restaurant: "${it.restaurant.name?:'-'}",
				itemCategory: "${it.itemCategory.defaultTitle?:'-'}",
				isActive: "${it.isActive?'Yes':'No'}",
				dateCreated: "${it.dateCreated?.format('yyyy-MM-dd')}",
				lastUpdated: "${it.lastUpdated?.format('yyyy-MM-dd')}",
				mappingCode: "${it.mappingCode?:'-'}",
				id: "${it.id}"]
		}

		def totalRows = items.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def searchItemVariant(def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for Item Variants with given search criteria:>${_criteria}")
		def criteria = ItemVariant.createCriteria()
		
		def itemVariants = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
			eq ("item.id", _criteria.data.itemId.toLong())
			and {
				eq("isPrimary", false)
			}
			
			if(_criteria.data.searchVariantIsActive) {
				eq ("isActive", _criteria.data.searchVariantIsActive.toBoolean())
			}

			if(_criteria.data.variantTitle) {
				and {
					itemVariantTranslations {
						eq("language.id", Constants.Languages.ENGLISH.getLanguagesId())
						and {
							ilike ("title", _criteria.data.variantTitle+"%")
						}
					}
				}
			}
			//Handle Title as sorting column differently...
			if("title".equals(_criteria.sortColumn)){
				itemVariantTranslations {
					eq("language.id", Constants.Languages.ENGLISH.getLanguagesId())
					order ("title", _criteria.sortOrder)
				}
				
			} else {
				order (_criteria.sortColumn, _criteria.sortOrder)
			}
		}
		
		def itemVariantTrans = null;
		
		def results = itemVariants.collect {
			itemVariantTrans = it.getTranslation()
			[DT_RowId: "${it.id}",
				title: "${itemVariantTrans.title?:'-'}",
				variant: "${it.variant.defaultTitle?:'-'}",
				price: "${it.price?:'-'}",
				approxPreparationTime: "${it.approxPreperationTime?:'-'}",
				description: "${itemVariantTrans.description}",
				isActive: "${it.isActive}",
				dateCreated: "${it.dateCreated?.format('yyyy-MM-dd')}",
				lastUpdated: "${it.lastUpdated?.format('yyyy-MM-dd')}",
				id: "${it.id}"]
		}

		def totalRows = itemVariants.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.isDebugEnabled()){
			log.debug("Total ItemVariant Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

    def saveItem(def data) {
		if(log.isDebugEnabled())
			log.debug("Save Item with data: ${data}")
		
		def itemInstance
		def user = springSecurityService.loadCurrentUser()
		def restaurant = null;
		boolean isAdmin = SpringSecurityUtils.ifAnyGranted("ROLE_SUPERADMIN")
		
		if(!isAdmin) {
			restaurant = Staff.findByUser(user)?.restaurant
		} else {
			restaurant = Restaurant.load(data["restaurant.id"]?.toLong())
		}
	
		if(data.id) {
			if(log.isDebugEnabled())
				log.debug("Edit item with id ${data.id}")

			itemInstance = Item.get(data.id.toLong())
			if(itemInstance) {
				itemInstance.properties["code", "mappingCode", "tags", "isActive", "spiceType", "itemCategory", "cuisineType", "version"] = data
				if(restaurant)
					itemInstance.restaurant = restaurant
				 
				ItemVariant variant = itemInstance.primaryVariant
				variant.properties["price", "approxPreperationTime"] = data

				def translation = variant.translation
				translation.properties["title", "description"] = data
				
				itemInstance.updatedBy = springSecurityService.principal.username
				if(itemInstance.validate())
					itemInstance.save(flush: true)
			} else {
				log.error ("No item found for given id: ${data.id}")
			}
		} else {// create mode
				if(log.isDebugEnabled())
					log.debug("Create new item")

				itemInstance = new Item()
				itemInstance.properties["code", "mappingCode", "title", "description", "tags", "isActive", "spiceType", "itemCategory", "cuisineType"] = data
				if(restaurant)
					itemInstance.restaurant = restaurant

				itemInstance.createdBy = springSecurityService.principal.username
				if(!data.title) {
					itemInstance.errors.rejectValue("title", "error.title.null")
				}
				if(!data.description) {
					itemInstance.errors.rejectValue("description", "error.description.null")
				}
				
				if(!itemInstance.hasErrors() && itemInstance.validate() && itemInstance.save()) {
					
					//Save primary variant
					ItemVariant iVariant = new ItemVariant()
					iVariant.properties["price", "approxPreperationTime"] = data
					iVariant.isPrimary = true
					iVariant.isActive = true
					iVariant.item = itemInstance
					iVariant.variant = Variant.findByRestaurantAndIsDefault(restaurant, true)
					iVariant.createdBy = springSecurityService.principal.username
					iVariant.save()
					
					//Save default translation
					def translation = new ItemVariantTranslation()
					translation.properties["title", "description"] = data
					translation.isDefault = true
					translation.showDescription = true
					translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
					translation.itemVariant = iVariant
					translation.save()
				}
		}
		return itemInstance
    }
	
    def saveItemAddon(def data) {
		def itemId = data.itemId
		if(itemId){
			Item item = Item.load(itemId)
			ItemAddon.executeUpdate("UPDATE ItemAddon SET isDeleted=1 where item = ?", [item])
            if(data.itemAddons instanceof String){//this is when only one addon is selected
                new ItemAddon(item: item, addon: Addon.load(data.itemAddons.toLong()), isDeleted: false).save(flush: true)
				return true
            } else {
                data.itemAddons.each {
                    new ItemAddon(item: item, addon: Addon.load(it.toLong()), isDeleted: false).save(flush: true)
                }
				return true
             }

		} else {
			log.error("ItemId cannot be null")
			return false
		}
    	
    }
    
	def saveItemVariant(def data) {
		if(log.isDebugEnabled())
			log.debug("Save Item Variant with data: ${data}")
		
		ItemVariant iVariant
		
		if(data.itemVariantId) { //Edit mode
			if(log.isDebugEnabled())
				log.debug("Edit item variant with id ${data.itemVariantId}")
			
			iVariant = ItemVariant.get(data.itemVariantId?.toLong())
			iVariant.properties["variant", "price", "approxPreperationTime", "isActive", "version"] = data
			iVariant.updatedBy = springSecurityService.principal.username
			
			def translation = iVariant.translation
			translation.properties["title", "description"] = data
			if(iVariant.validate(true)) {
				iVariant.save()
			}
		} else { //Create mode
			
			def itemId = data.itemId
			if(itemId){
				Item item = Item.load(itemId)
		
				def user = springSecurityService.loadCurrentUser()
				
				//Save primary variant
				iVariant = new ItemVariant()
				iVariant.properties["variant", "price", "approxPreperationTime", "isActive"] = data
				iVariant.isPrimary = false
				iVariant.isActive = true
				iVariant.item = item
				iVariant.createdBy = springSecurityService.principal.username
				
				//Save default translation
				def translation = new ItemVariantTranslation()
				translation.properties["title", "description", "showDescription"] = data
				translation.isDefault = true
				translation.showDescription = true
				translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
				translation.itemVariant = iVariant
				//translation.save()
				
				iVariant.addToItemVariantTranslations(translation)
				iVariant.save()
			}
		}
		return iVariant
	}

	def saveItemVariantTranslation(def data) {
		if(log.isDebugEnabled())
			log.debug("Save ItemVariantTranslation with data: ${data}")
		
		ItemVariantTranslation iVariantTranslation
		
		if(data.itemVariantTransId) { //Edit mode
			if(log.isDebugEnabled())
				log.debug("Edit itemVariantTranslation with id ${data.itemVariantTransId}")
			
			iVariantTranslation = ItemVariantTranslation.get(data.itemVariantTransId.toLong())
			iVariantTranslation.properties["title", "description", "showDescription"] = data
			if(iVariantTranslation.validate(true)) {
				iVariantTranslation.save()
			}
		} else { //Create mode
			
			//Save default translation
			iVariantTranslation = new ItemVariantTranslation()
			iVariantTranslation.properties["itemVariant", "title", "description", "showDescription", "language"] = data
			iVariantTranslation.isDefault = false
			iVariantTranslation.save()
		}
		return iVariantTranslation
	}

	def loadImages(def data) {
		def config = grailsApplication.config
		def results = []
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"
		if(data.id) {
			Item item = Item.get(data.id);
			def list = ItemMediaContent.findAllByItemAndIsActive(item, true, [sort: "displayOrder", order: "asc"])
			def absoultePath = getAbsolutePath(item, config)
			Path imagePath
			
				results = list.collect {
				if(it.imageName) {
					//load the image
					imagePath = Paths.get(new StringBuilder(absoultePath)
						.append(File.separator)
						.append(it.imageName).toString())
					
					if(log.isDebugEnabled())
						log.debug "Path: ${imagePath}"
						
					if(Files.exists(imagePath)) {
					if(log.isDebugEnabled())
						log.debug "Path: file exists"
						String path = "${config.imageRemoteURL}/${getPath(item, config)}"
						//load the file
						[
							id: it.id,
							name: it.imageName,
							originalName: it.imageNameOriginal,
							size: Files.size(imagePath),
							url: "${path}/${it.imageName}",
							thumbnailUrl: "${path}/${it.imageNameSmall}",
							deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${it.id}",
							deleteType: "DELETE"
						]
					}
				}
			}
		}
		return results
	}
	
	def saveImage(def data, def file) {
		def config = grailsApplication.config
		def result = []
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"

		/*
		 * 1- Create a folder if doesn't exist for itemsImageFolder
		 * 2- Create a folder if doesn't exist with restaurant ID in itemsImageFolder/item/
		 * 3- Create a folder if doesn't exist for that item
		 * 4- Create the file with unique name along with its thumbnail
		 */
		
		if(data.id) {
			Item item = Item.get(data.id);
			Path dir = Paths.get(getAbsolutePath(item, config))
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
			
			//Create the ItemMediaContent
			ItemMediaContent mediaContent = new ItemMediaContent();
			mediaContent.imageName = newFilename
			mediaContent.imageNameOriginal = file.originalFilename
			mediaContent.imageNameSmall = thumbnailFilename
			mediaContent.isActive = true
			mediaContent.item = item
			mediaContent.videoSourceType = VideoSourceType.load((config.defaultVideoSourcetype?:1).toLong())
			mediaContent.createdBy = springSecurityService.principal.username
			
			// set the display order
			def results = ItemMediaContent.withCriteria {
				projections {
					max "id"
				}
			}
		
			mediaContent.displayOrder =  results[0]? results[0]: 1
	
			mediaContent.save(flush: true)
			
			if(log.debugEnabled)
				log.debug "Saving new ItemMediaContent(${mediaContent.id})"
				
			String path = "${config.imageRemoteURL}/${getPath(item, config)}"
			
			result = [
					name: mediaContent.imageName,
					originalName: mediaContent.imageNameOriginal,
					size: file.size,
					url: "${path}/${mediaContent.imageName}",
					thumbnailUrl: "${path}/${mediaContent.imageNameSmall}",
					deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${mediaContent.id}",
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
			ItemMediaContent itemMediaContent = ItemMediaContent.get(data.id);
			if(itemMediaContent){
				itemMediaContent.delete()
				if(log.debugEnabled)
					log.debug "Deleting Item media (${itemMediaContent.id})"
		
				Path dir = Paths.get(getAbsolutePath(itemMediaContent.item, config))
				if(log.isDebugEnabled())
					log.debug "Path to images directory: ${dir}"
				
				if(Files.exists(dir)) {
					if(log.isDebugEnabled())
						log.debug "Image exist, deleting image: ${dir}/${itemMediaContent.imageName}"
					File picFile = new File("${dir}/${itemMediaContent.imageName}")
					picFile.delete()
					File thumbnailFile = new File("${dir}/${itemMediaContent.imageNameSmall}")
					thumbnailFile.delete()
				}
			}
		}
	}
	
	public def loadItemsForCategory(ItemCategory category) {
		if(category) {
			return Item.findAll (sort: "code") {
				itemCategory == category &&
				isActive == true &&
				isDeleted == false
			}
		} else {
			return null
		}
	}
	
	public def loadItemVariantsForItem(Item item) {
		if(item) {
			return item.getActiveVariants()
		} else {
			return null
		}
	}

	public def loadAddonsForItem(Item item) {
		if(item) {
			return item.getCurrentItemAddons()
		} else {
			return null
		}
	}

	//image path strategy is: globalImagePath/itemsImageFolder/${restaurantId}/<ITEM_ID>/<IMAGES>
	
	private def getAbsolutePath(def item, def config) {
		return new StringBuilder(config.globalImagePath)
		.append(File.separator)
		.append(getPath(item, config))
		.toString()
	}
	
	private def getPath(def item, def config) {
		return new StringBuilder(config.itemsImageFolder)
		.append(Utils.PATH_SEPARATOR)
		.append(item.restaurant.id)
		.append(Utils.PATH_SEPARATOR)
		.append(item.id)
		.toString()
	}

}
