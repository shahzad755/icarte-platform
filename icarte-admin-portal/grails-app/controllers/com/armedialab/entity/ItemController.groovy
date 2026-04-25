package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import com.armedialab.ItemManagementService

@Transactional(readOnly = true)
class ItemController {
	
	static allowedMethods = [save: "POST", update: "PUT", deleteItem: "DELETE", toggleActivationOfItemVariant: "DELETE", list: "POST"]
	def propertiesToRender = ['code', 'title', 'price', 'restaurant', 'itemCategory', 'isActive', 'dateCreated', 'lastUpdated', 'mappingCode']
	def variantPropertiesToRender = ['title', 'dateCreated', 'lastUpdated']
	
	def ItemManagementService itemManagementService
	def springSecurityService
	def grailsApplication
	
	def index() {
		if(!request.xhr){
			[categories: loadItemCategoryList()]
		} else {
			log.warn("XHR request for index action are not supported!")
		}
	}
	
	def list() {
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		def results = itemManagementService.searchItem (
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON

	}
	
	def edit(Item itemInstance) {
		def pVariant = itemInstance.primaryVariant
		itemInstance.price = pVariant.price
		itemInstance.approxPreparationTime = pVariant.approxPreperationTime
		
		def trans = pVariant.translation
		itemInstance.title = trans?.title
		itemInstance.description = trans?.description
		render (view: 'edit', model: [itemInstance: itemInstance, 
			categories: loadItemCategoryList(),
			spiceTypeList: loadSpiceTypeList(),
			cuisineTypeList: loadCuisineTypeList(),
			addons: loadAddonList()])
		//respond itemInstance
	}

	def create() {
		if(log.isDebugEnabled())
			log.debug("Params for item->create: ${params}")
		def item = new Item(params)
		render (view: 'create', model: [itemInstance: item, 
										categories: loadItemCategoryList(), 
										spiceTypeList: loadSpiceTypeList(), 
										cuisineTypeList: loadCuisineTypeList()])
		//respond item
	}

	@Transactional
	def save() {
		if(log.isDebugEnabled())
			log.debug("Params for item: ${params}")
			
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		def id
		def op = params.id ? "Updated" : "Added"
		def itemInstance = itemManagementService.saveItem(params)
		
		if(itemInstance) {
			if(!itemInstance.hasErrors()) {
				msg = "Item \"${itemInstance.code}\" ${op} successfully"
				id = itemInstance.id
				state = "OK"
			}
			else {
				// Capture any validation messages to display on the client side
				response.status = response.SC_INTERNAL_SERVER_ERROR
				errs = itemInstance.errors.allErrors.collect {
					log.debug("Error:[${it}]")
					[field: it.field, error: message(error:it, encodeAs:'HTML')]
				}
			}
			def jsonData = [message: msg, errors: errs, state: state, id: id]
			render jsonData as JSON

		} else {
			response.status = response.SC_NOT_FOUND
			render noRecord("Item", null) as JSON
		}
	}

	@Transactional
	def saveAddon() {
		if(log.isDebugEnabled())
			log.debug("Params for item addon: ${params}")
			
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		def id
		
		def isSuccess = itemManagementService.saveItemAddon(params)
		
		if(isSuccess) {
				msg = "Addons linked/de-linked with item successfully.."
				state = "OK"
			}
			else {
				// Capture any validation messages to display on the client side
				response.status = response.SC_INTERNAL_SERVER_ERROR
				errs =  [["error":	 "An error occured while processing your request. Please contact administrator!"]]
			}
			if(log.isDebugEnabled())
				log.debug("Item.save result after processing: ${msg}")
			def jsonData = [message: msg, errors: errs, state: state]
			render jsonData as JSON
	}

	def listItemVariants() {
		if(log.isDebugEnabled())
			log.debug("ItemController ItemVariant Grid requested")
	
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? variantPropertiesToRender[sortParam]: variantPropertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		def results = itemManagementService.searchItemVariant (
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON

	}

	@Transactional
	def deleteItem() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"

		if(params.id) {
			def item = Item.get(params.id.trim())
			if(item != null) {
				if(log.isDebugEnabled())
					log.debug "Marking the item with id: ${params.id} as deleted"
				
				item.isDeleted = true
				item.save(flush: true)
				state = "OK"
				msg = "Item ${item.code} marked as 'Deleted' successfully!"
				def jsonData = [message: msg, errors: errs, state: state]
				render jsonData as JSON
			} else {
				render noRecord(params.id, "Translation", messageSource, response.SC_NOT_FOUND) as JSON
			}

		}
	}

	def loadItemCategoryList() {
		def user = springSecurityService.loadCurrentUser()
		def categoryList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			categoryList = ItemCategory.findAll("from ItemCategory c where c.isActive = ?", [true])
		} else {
			categoryList = ItemCategory.findAll("from ItemCategory c where c.isActive = ? and c.restaurant = ?",
				[true, Staff.findByUser(user)?.restaurant])
		}
		return categoryList
	}

	def loadAddonList() {
		def user = springSecurityService.loadCurrentUser()
		def addonList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			addonList = Addon.findAll("from Addon a where a.isActive = ?", [true])
		} else {
			addonList = Addon.findAll("from Addon c where c.isActive = ? and c.restaurant = ?",
					[true, Staff.findByUser(user)?.restaurant])
		}
		return addonList
	}
	
	def loadCuisineTypeList() {
		def user = springSecurityService.loadCurrentUser()
		def cuisineList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			cuisineList = CuisineType.findAll("from CuisineType a where a.isActive = ?", [true])
		} else {
			cuisineList = CuisineType.findAll("from CuisineType c where c.isActive = ? and c.restaurant = ?",
					[true, Staff.findByUser(user)?.restaurant])
		}
		return cuisineList
	}
	
	def loadSpiceTypeList() {
		def user = springSecurityService.loadCurrentUser()
		def spiceList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			spiceList = SpiceType.findAll("from SpiceType a where a.isActive = ?", [true])
		} else {
			spiceList = SpiceType.findAll("from SpiceType c where c.isActive = ? and c.restaurant = ?",
					[true, Staff.findByUser(user)?.restaurant])
		}
		return spiceList
	}
	
	def loadVariantList() {
		def user = springSecurityService.loadCurrentUser()
		def variantList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			variantList = Variant.findAll("from Variant v where v.isActive = ? and v.isDefault = ?", [true, false])
		} else {
			variantList = Variant.findAll("from Variant v where v.isActive = ? and v.isDefault = ? and v.restaurant = ?",
				[true, false, Staff.findByUser(user)?.restaurant])
		}
		return variantList
	}

	private Map noRecord(name, id) {
		log.debug "Record with name ${name}, id: ${id} not found"
		
		def error
		if(id)
			error = [["error":	 message(code: 'default.not.found.message', args: [
						message(code: 'item.label', default: name),id])
						]]
		else
			error =  [["error":	 "Request parameter 'id' is null"]]
		return [errors: error, state: response.SC_NOT_FOUND]
	}

	def createItemVariant() {
		if(log.isDebugEnabled())
			log.debug("Params for itemVariant: ${params}")
		def itemVariant = new ItemVariant(params)
		itemVariant.approxPreperationTime = grailsApplication.config.approxPreparationTime.toInteger()
		render (view: '/itemVariant/create', model: [itemVariantInstance: itemVariant, itemId: params.itemId, variantList: loadVariantList()])
	}

	@Transactional
	def saveItemVariant() {
		if(log.isDebugEnabled())
			log.debug("Params for itemVariant: ${params}")
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		def id
		def op = params.itemVariantId ? "Updated" : "Added"
		def itemVariantInstance = itemManagementService.saveItemVariant(params)
		
		if(itemVariantInstance) {
			if(!itemVariantInstance.hasErrors()) {
				msg = "Item \"${params.title}\" ${op} successfully"
				id = itemVariantInstance.id
				state = "OK"
			}
			else {
				// Capture any validation messages to display on the client side
				response.status = response.SC_INTERNAL_SERVER_ERROR
				errs = itemVariantInstance.errors.allErrors.collect {
					log.debug("Error:[${it}]")
					[field: it.field, error: message(error:it, encodeAs:'HTML')]
				}
			}
			def jsonData = [message: msg, errors: errs, state: state, id: id]
			render jsonData as JSON

		} else {
			response.status = response.SC_NOT_FOUND
			render noRecord("Item Varaint", null) as JSON
		}	
	}

	def editItemVariant(ItemVariant itemVariantInstance) {
		if(log.isDebugEnabled())
			log.debug("Params for itemVariant in editItemVariant: ${params}")
		if(itemVariantInstance) {
			def trans = itemVariantInstance.translation
			itemVariantInstance.title = trans?.title
			itemVariantInstance.description = trans?.description
			render (view: '/itemVariant/edit', model: [itemVariantInstance: itemVariantInstance, variantList: loadVariantList()])
			
		} else {
			response.status = response.SC_NOT_FOUND
			render noRecord("Item Varaint", null) as JSON
		}
	}
	@Transactional
	def toggleActivationOfItemVariant() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"

		if(params.id) {
			def itemVariant = ItemVariant.get(params.id.trim())
			if(itemVariant != null) {
				itemVariant.isActive = !itemVariant.isActive
				itemVariant.save(flush: true)
				state = "OK"
				msg = "Item ${itemVariant.defaultTitle} marked as ${itemVariant.isActive?'Activated': 'De-Activated'} successfully!"
				def jsonData = [message: msg, errors: errs, state: state]
				render jsonData as JSON
			} else {
				render noRecord(params.id, "Item", messageSource, response.SC_NOT_FOUND) as JSON
			}

			}
	}
	
	def loadImages() {
		log.info "Loading images for params: ${params}"
		params.serverPath = servletContext.contextPath
		def jsonData = [files: itemManagementService.loadImages(params)]
		render jsonData as JSON
	}
	
	@Transactional
	def uploadImage() {
		log.info "Params for ItemController.uploadImage: ${params}"
		switch(request.method){
			case "POST":
				params.serverPath = servletContext.contextPath
				def results = []
				if (request instanceof MultipartHttpServletRequest){
					MultipartFile file
					for(filename in request.getFileNames()){
						file = request.getFile(filename)
						results << itemManagementService.saveImage(params, file)
					}
				}
				def jsonData = [files: results]
				render jsonData as JSON
				break;
			default: render status: HttpStatus.METHOD_NOT_ALLOWED.value()
		}
	}

	@Transactional
	def updateDisplayOrder(){
		if(log.isDebugEnabled()){
			log.debug("Item Media Content: ${params}")
		}
		def displayOrder = params["displayorder[]"]
		ItemMediaContent ic
		displayOrder.eachWithIndex{ content, index ->
			ic = ItemMediaContent.get(content.toLong())
			ic.displayOrder = index+1
			ic.save(flush: true)
			if(log.debugEnabled)
				log.debug("Setting display order of item media content [${ic.id}] as [${ic.displayOrder}]")
		}
		def result = [success: true, state: "OK", message: "Display order of the item media updated successfully"]
		render result as JSON
	}

	@Transactional
	def deleteImage(){
		itemManagementService.deleteImage(params)
		def result = [success: true]
		render result as JSON
	}

}
