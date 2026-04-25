package com.armedialab.reference

import grails.transaction.Transactional
import groovy.sql.Sql

import java.awt.image.BufferedImage
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

import javax.imageio.ImageIO

import org.imgscalr.Scalr

import com.armedialab.entity.ItemCategory
import com.armedialab.entity.ItemCategoryTranslation
import com.armedialab.entity.Menu
import com.armedialab.entity.MenuItemCategory
import com.armedialab.entity.RefLanguage
import com.armedialab.entity.Restaurant
import com.armedialab.entity.Staff
import com.armedialab.util.Constants
import com.armedialab.util.Utils

@Transactional
class ItemCategoryManagementService {

	def grailsApplication
	def springSecurityService
	def dataSource
	
	private String SEARCH_ITEM_CATEGORIES = '''
		select ic.item_category_id, ict.title, ict.description, ic.mapping_code,
		        (select group_concat(mm.title) 
		          from menu_item_category mic2, menu mm 
		            where ic.item_category_id = mic2.item_category_id
		              and mic2.menu_id = mm.menu_id
		            ) as menu_title,
		        ic.is_active
		  from  item_category ic,
		        ref_language rl,
		        item_category_translation ict
		  where ic.item_category_id = ict.item_category_id
		   and  ict.language_id = rl.language_id
		   and  rl.language_id =:langId
    '''
	
	def searchItemCategories(def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for item categories with given search criteria:>${_criteria}")

		StringBuilder hql = new StringBuilder(SEARCH_ITEM_CATEGORIES)
		def hqlParams = [langId: Constants.Languages.ENGLISH.getLanguagesId()]
		def orderBy = " order by ic.display_order asc"
		
		def user = springSecurityService.loadCurrentUser()
		
		def authority = springSecurityService.authentication.authorities.find {
			it.authority == "ROLE_SUPERADMIN"
		}
		if(!authority) {
			hql.append(" and ic.restaurant_id =:restaurantId")
			hqlParams['restaurantId'] = Staff.findByUser(user)?.restaurant?.id
		}
		
		if(_criteria.data['search[value]']) {
			hql.append(" and ict.title like(:qry)")
			hqlParams['qry'] = _criteria.data['search[value]']+"%"
		}
		
		hql.append(orderBy)
		if(log.isDebugEnabled()) {
			log.debug "SQL: ${hql} \n Criteria: ${hqlParams}"
		}
		def results = []
		new Sql(dataSource).eachRow(hql.toString(), hqlParams) { row ->
					results << [
							DT_RowId:"${row.item_category_id}",
							title: "${row.title}",
							description: "${row.description?:''}",
							mappingCode: "${row.mapping_code?:'-'}",
							menuTitle: "${row.menu_title}",
							isActive: "${row.is_active?'Yes':'No'}",
							id: "${row.item_category_id}"
							]
				}
				
		def totalRows = results.size()
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

	def saveItemCatgory(def data) {
		ItemCategory itemCategory
		def user = springSecurityService.loadCurrentUser()
		if(data.id) {
			//Edit
			itemCategory = ItemCategory.get(data.id as Long)
			if(itemCategory!=null) {
				if(log.isDebugEnabled()) {
					log.debug("Updating ItemCategory [${itemCategory.id}]")
				}
				itemCategory.properties["mappingCode", "parentCategory", "isActive", "version"] = data

				def translation = itemCategory.itemCategoryTranslations?.find {
					it.language.id == Constants.Languages.ENGLISH.getLanguagesId()
				}
				translation.title = data['itemCategoryTranslations[0].title']
				translation.description = data['itemCategoryTranslations[0].description']
				
				
				
				itemCategory.updatedBy = springSecurityService.principal.username
				//assignMenus(itemCategory, data)
				itemCategory.save flush:true
			} else {
				log.error("No itemCategory found for the given id: ${data.id}")
			}
		} else { //New
			if(log.isDebugEnabled()) {
				log.debug("Creating new ItemCategory...")
			}

			itemCategory = new ItemCategory()
			itemCategory.properties["mappingCode", "parentCategory", "isActive", "version"] = data
			itemCategory.createdBy = springSecurityService.principal.username
			
			def translation = new ItemCategoryTranslation()
			translation.title = data.title
			translation.description=data.description
			translation.showDescription=data.showDescription
			translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
			
			itemCategory.addToItemCategoryTranslations(translation)
			def superAdmin = springSecurityService.authentication.authorities.find {
				it.authority == "ROLE_SUPERADMIN"
			}
	
			if (superAdmin) {
				itemCategory.restaurant = Restaurant.load(data["restaurant.id"] as Long)
			} else {
				itemCategory.restaurant = Staff.findByUser(user)?.restaurant
			}
			
			// set the display order
			def results = ItemCategory.withCriteria {
				projections {
					max "id"
				}
			}
		
			itemCategory.displayOrder = results[0]? results[0]: 1
		}
		
		//common for new & edit scenarios
		if(data.menuItemCategories?.size()>0) {
			if(itemCategory.validate() && itemCategory.save(flush: true)) {
				if(log.isDebugEnabled()) {
					log.debug("ItemCategory saved with ID [${itemCategory.id}]")
				}
				assignMenus(itemCategory, data)
			}
		} else {
			log.warn("No Menu Group assigned to Item Category [${itemCategory.id}]")
			itemCategory.errors.rejectValue("menuItemCategories", "error.itemCategories.null")
		}
		return itemCategory
	}
	
	def assignMenus(ItemCategory itemCategory, def data) {
		if(itemCategory){
			if(data.menuItemCategories?.size()>0) {
				def menuItemCat
				MenuItemCategory.executeUpdate("DELETE FROM MenuItemCategory where itemCategory = ?", [itemCategory])
				if(data.menuItemCategories instanceof String){//this is when only one menu is selected
					menuItemCat = new MenuItemCategory(itemCategory: itemCategory, menu: Menu.load(data.menuItemCategories.toLong()), isDeleted: false)
					if(!menuItemCat.validate() || !menuItemCat.save()) {
						itemCategory.errors.rejectValue("menuItemCategories", "error.itemCategories.menu")
					}
				} else {
					data.menuItemCategories.each {
						menuItemCat = new MenuItemCategory(
							itemCategory: itemCategory, 
							menu: Menu.load(it.toLong()), 
							isDeleted: false)
						if(!menuItemCat.validate() || !menuItemCat.save()) {
							itemCategory.errors.rejectValue("menuItemCategories", "error.itemCategories.menu")
						}
					}
				 }
			} else {
				log.error("itemCatgory.menuItemCategories shouldn't be null")
			}
		}
	}

	def loadImages(def data) {
		def result = []
		def config = grailsApplication.config
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"
			
		if(data.id) {
			ItemCategory itemCategory = ItemCategory.get(data.id)
			if(itemCategory.imageUrl) {
				//load the image
				Path categoryImages = Paths.get(new StringBuilder(getAbsolutePath(itemCategory, config))
					.append(File.separator)
					.append(itemCategory.imageUrl).toString())
				
				if(log.isDebugEnabled())
					log.debug "Path: ${categoryImages}"
					
				if(Files.exists(categoryImages)) {
					log.debug "Path: file exists"
					String path = "${config.imageRemoteURL}/${getPath(itemCategory, config)}"
					//load the file
					result = [
						name: itemCategory.imageUrl,
						originalName: itemCategory.originalImageName,
						size: Files.size(categoryImages),
						url: "${path}/${itemCategory.imageUrl}",
						thumbnailUrl: "${path}/${itemCategory.smallIconUrl}",
						deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${itemCategory.id}",
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
		def result = []
		def config = grailsApplication.config
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"

		/* 1- Create a folder if doesn't exist with restaurant ID in (This can be done at the time of
		 * restaurant creation) global 
		 * 2- Create a folder if doesn't exist with itemCategory ID
		 * 3- Create the file with unique name
		 */
		
		if(data.id) {
			ItemCategory itemCategory = ItemCategory.get(data.id)
			//load the image
			Path dirCategory = Paths.get(getAbsolutePath(itemCategory, config))
			if(log.isDebugEnabled())
				log.debug "Path to categoryImages: ${dirCategory}"
			
			if(!Files.exists(dirCategory)) {
				log.debug "CategoryImages directory does not exist, creating new hierarchy for path: ${dirCategory}"
				dirCategory = Files.createDirectories(dirCategory)
			}
			
			String newFilenameBase = UUID.randomUUID().toString()
			String originalFileExtension = file.originalFilename.substring(
				file.originalFilename.lastIndexOf("."))
			String newFilename = newFilenameBase + originalFileExtension
			File newFile = new File("${dirCategory}/${newFilename}")
			file.transferTo(newFile)
			
			if(log.debugEnabled) {
				log.debug "File: ${dirCategory}/${newFilename} created, now setting correct permissions.."
			}
			//Setting permissions
			Utils.updatePermissions(newFile, config.apacheGroupName)

			BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), 56, 56);
			String thumbnailFilename = newFilenameBase + '-thumbnail.png'
            File thumbnailFile = new File("${dirCategory}/${thumbnailFilename}")
            ImageIO.write(thumbnail, 'png', thumbnailFile)
			thumbnail.flush()

			if(log.debugEnabled)
				log.debug "Thumbnail: ${dirCategory}/${thumbnailFilename} created.."

			//Setting permissions
			Utils.updatePermissions(thumbnailFile, config.apacheGroupName)
			
			//Update the itemCategory
			itemCategory.imageUrl = newFilename
			itemCategory.originalImageName = file.originalFilename
			itemCategory.smallIconUrl = thumbnailFilename
			itemCategory.save(flush: true)
			
			if(log.debugEnabled)
				log.debug "Updating ItemCategory(${itemCategory.id})"
				
			String path = "${config.imageRemoteURL}/${getPath(itemCategory, config)}"
			
			result = [
					originalName: file.originalFilename,
					name: itemCategory.imageUrl,
					size: file.size,
					url: "${path}/${itemCategory.imageUrl}",
					thumbnailUrl: "${path}/${itemCategory.smallIconUrl}",
					deleteUrl: "${data.serverPath}/${data.controller}/deleteImage?id=${itemCategory.id}",
					deleteType: "DELETE"
			]
		}
		if(log.debugEnabled)
			log.debug "Returning result ${result}"
		return result
	}

	def deleteImage(data){
			def result = []
			def config = grailsApplication.config
		if(log.isDebugEnabled())
			log.debug "Global Image Path: ${config.globalImagePath}"

		if(data.id) {
			ItemCategory itemCategory = ItemCategory.get(data.id)
			//load the image
			Path dirCategory = Paths.get(getAbsolutePath(itemCategory, config))
			
			if(log.isDebugEnabled())
				log.debug "Path to categoryImages: ${dirCategory}"
			
			if(Files.exists(dirCategory)) {
				if(log.isDebugEnabled())
					log.debug "Image exist, deleting image: ${dirCategory}/${itemCategory.imageUrl}"
				File picFile = new File("${dirCategory}/${itemCategory.imageUrl}")
				picFile.delete()
				File thumbnailFile = new File("${dirCategory}/${itemCategory.smallIconUrl}")
				thumbnailFile.delete()
				//Update the itemCategory
				itemCategory.imageUrl = null
				itemCategory.originalImageName = null
				itemCategory.smallIconUrl = null
				itemCategory.save(flush: true)
				
				if(log.debugEnabled)
					log.debug "Updating ItemCategory(${itemCategory.id})"
			}
		}
	}

	public def getAbsolutePath(def category, def config) {
		return new StringBuilder(config.globalImagePath)
		.append(File.separator)
		.append(getPath(category, config))
		.toString()
	}
	
	public def getPath(def category, def config) {
		return new StringBuilder(
			config.categoriesImageFolder)
			.append(Utils.PATH_SEPARATOR)
			.append(category.restaurant.id)
			.append(Utils.PATH_SEPARATOR)
			.append(category.id)
			.toString()
	}


}
