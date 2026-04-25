package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import com.armedialab.reference.ItemCategoryManagementService
import com.armedialab.util.Constants
import com.armedialab.entity.Menu

@Transactional(readOnly = true)
class ItemCategoryController {

    static allowedMethods = [save: "POST", update: "PUT", deleteImage: "DELETE", list: "POST", uploadImage: ["POST", "GET"]]
	def propertiesToRender = ['title', 'parentCategoryId', 'description', 'mappingCode', 'menuTitle', 'isActive']
	
	def ItemCategoryManagementService itemCategoryManagementService
	def springSecurityService
	
	def index() {
	}
	
	def list() {
		def sortParam = params['order[0][column]']?.toInteger()

		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'

		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;

		def results = itemCategoryManagementService.searchItemCategories(
				[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])

		def jsonData = [draw: params.draw,
			total: results.numberOfPages,
			recordsTotal: results.totalRows,
			recordsFiltered: results.totalRows,
			data: results.records]
		render jsonData as JSON
		
		
		//render (view: 'index', model: [itemCategoryInstanceList: itemCategoryManagementService.searchItemCategories(params)])
	}

    def show(ItemCategory itemCategoryInstance) {
		loadDefaultTranslation(itemCategoryInstance)
        //respond itemCategoryInstance [status: CREATED]
		render (view:'show', model:['itemCategoryInstance': itemCategoryInstance, menus: itemCategoryInstance.menuItemCategories])
    }

	void loadDefaultTranslation(def itemCategoryInstance) {
		itemCategoryInstance.itemCategoryTranslations = ItemCategoryTranslation.findAllWhere(
			itemCategory: itemCategoryInstance,
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
	}

    def create() {
		render (view: 'create', model: [itemCategoryInstance: new ItemCategory(isActive: true), 
			menus: loadMenuList(), parentCats: loadParentCategoryList()])
    }

	def loadMenuList() {
		def user = springSecurityService.loadCurrentUser()
		def menuList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			menuList = Menu.findAll("from Menu m where m.isActive = ? and m.isDeleted = ?", [true, false])
		} else {
			menuList = Menu.findAll("from Menu m where m.isActive = ? and m.isDeleted = ? and m.restaurant = ?",
				[true, false, Staff.findByUser(user)?.restaurant])
		}
		return menuList
	}
	
	def loadParentCategoryList() {
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = ItemCategory.findAll("from ItemCategory as itemCat where itemCat.isActive = ?", [true])
		} else {
			results = ItemCategory.findAll("from ItemCategory as itemCat where itemCat.isActive = ? and itemCat.restaurant = ?",
				[true, Staff.findByUser(user)?.restaurant])
		}
		return results
	}
	
    @Transactional
    def save() {
		def itemCategoryInstance = itemCategoryManagementService.saveItemCatgory(params)
		
		if (!itemCategoryInstance || itemCategoryInstance.hasErrors()) {
			respond itemCategoryInstance.errors,
			[view:'create', model: [itemCategoryInstance: itemCategoryInstance,
							menus: loadMenuList(), parentCats: loadParentCategoryList()]]
		   return
		}

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', 
					args: [message(code: 'itemCategory.label', default: 'ItemCategory'), params.title])
                redirect itemCategoryInstance
            }
            '*' { respond itemCategoryInstance, [status: CREATED] }
        }
    }

    def edit(ItemCategory itemCategoryInstance) {
		loadDefaultTranslation(itemCategoryInstance)
		render (view: 'edit', model: [itemCategoryInstance: itemCategoryInstance, 
							menus: loadMenuList(), parentCats: loadParentCategoryList()])
        //respond itemCategoryInstance
    }

    @Transactional
    def update() {
		if(log.isDebugEnabled())
			log.debug("Params for Item category >>>>>>>>>: ${params}")
		
        if (!params.id) {
            notFound()
            return
        }
		def itemCategoryInstance = itemCategoryManagementService.saveItemCatgory(params)
		if (!itemCategoryInstance || itemCategoryInstance.hasErrors()) {
			respond itemCategoryInstance.errors,
			[view:'edit', model: [itemCategoryInstance: itemCategoryInstance, 
							menus: loadMenuList(), parentCats: loadParentCategoryList()]]
		   return
		}
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', 
					args: [message(code: 'ItemCategory.label', default: 'ItemCategory'), params["itemCategoryTranslations[0].title"]])
                redirect itemCategoryInstance
            }
            '*'{ respond itemCategoryInstance, [status: OK] }
        }
    }
	
	def loadImages() {
		def results = []
		params.serverPath = servletContext.contextPath
		results << itemCategoryManagementService.loadImages(params)
		def jsonData = [files: results]
		render jsonData as JSON
	}
	
	@Transactional
	def uploadImage() {
		switch(request.method){
			case "POST":
				params.serverPath = servletContext.contextPath
				def results = []
				if (request instanceof MultipartHttpServletRequest){
					MultipartFile file
					for(filename in request.getFileNames()){
						file = request.getFile(filename)
						results << itemCategoryManagementService.saveImage(params, file)
					}
				}
				def jsonData = [files: results]
				render jsonData as JSON
				break;
			default: render status: HttpStatus.METHOD_NOT_ALLOWED.value()
		}
	}

	@Transactional
	def deleteImage(){
		itemCategoryManagementService.deleteImage(params)
		def result = [success: true]
		render result as JSON
	}
	
	@Transactional
	def updateDisplayOrder(){
		if(log.isDebugEnabled()){
			log.debug(params)
		}
		def displayOrder = params["displayorder[]"]
		ItemCategory ic
		displayOrder.eachWithIndex{ cat, index ->
			ic = ItemCategory.get(cat.toLong())
			ic.displayOrder = index+1
			ic.save(flush: true)
			if(log.debugEnabled)
				log.debug("Setting display order of item category [${ic.id}] as [${ic.displayOrder}]")
		}
		def result = [success: true, state: "OK", message: "Display order of the categories updated successfully"]
		render result as JSON
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemCategory.label', default: 'ItemCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
