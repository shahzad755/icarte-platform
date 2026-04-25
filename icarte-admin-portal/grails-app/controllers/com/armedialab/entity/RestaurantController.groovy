package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import com.armedialab.reference.RestaurantManagementService;
import com.armedialab.util.Constants

@Transactional(readOnly = true)
class RestaurantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def springSecurityService
	def RestaurantManagementService restaurantManagementService
	
    def index(Integer max) {
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
	        params.max = Math.min(max ?: 10, 100)
	        respond Restaurant.list(params), model:[restaurantInstanceCount: Restaurant.count()]
		} else {
			//def list = [springSecurityService.loadCurrentUser()?.staff?.restaurant]
			//respond list, model:[restaurantInstanceCount: 1]
			render (view: "show", model: [restaurantInstance: springSecurityService.loadCurrentUser()?.staff?.restaurant])
		}
    }

/*	def index(Integer max) {
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = Restaurant.list(params)
			
		} else {
			results << Restaurant.get(Staff.findByUser(user)?.restaurant?.id)
		}
		render (view: 'index', model: [restaurantInstanceList: results, restaurantInstanceCount: Restaurant.count()])
	}*/
	
    def show(Restaurant restaurantInstance) {
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def restaurant = Staff.findByUser(user)?.restaurant
			if(restaurantInstance?.id.equals(restaurant.id)) {
				loadDefaultTranslation(restaurantInstance)
				respond restaurantInstance
			} else {
				redirect(uri: "/denied")
			}
		} else {
			loadDefaultTranslation(restaurantInstance)
        	respond restaurantInstance
		}
    }

	void loadDefaultTranslation(def restaurantInstance) {
		restaurantInstance.restaurantTranslations = RestaurantTranslation.findAllWhere(
			restaurant: restaurantInstance,
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
	}

    def create() {
        respond new Restaurant(params)
    }

    @Transactional
    def save(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view:'create'
            return
        }

		def translation = new RestaurantTranslation()
		translation.title = params.title
		translation.description=params.description
		translation.showDescription=params.showDescription
		translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
		log.info "Translations: " + translation
		restaurantInstance.addToRestaurantTranslations(translation)

		restaurantInstance.activationKey = UUID.randomUUID().toString();
		restaurantInstance.createdBy = springSecurityService.principal.username

		//Save default statuses
		//StatusType st = new StatusType(name)
		
		//Save default Variant Type
		VariantType varType = new VariantType()
		varType.isDefault = true
		varType.isActive = true
		varType.restaurant = restaurantInstance
		//var.variantType = VariantType.load(Constants.DEFAULT_VARIANT_TYPE_ID)
		varType.createdBy = springSecurityService.principal.username
		varType.save()

		//Save default Variant
		Variant var = new Variant()
		var.isDefault = Boolean.TRUE
		var.restaurant = restaurantInstance
		var.variantType = varType
		var.createdBy = springSecurityService.principal.username
		
		def variantTranslation = new VariantTranslation()
		variantTranslation.title = Constants.REGULAR_VARIANT
		variantTranslation.description="Regular Variant"
		variantTranslation.isDefault = true
		variantTranslation.showDescription=Boolean.FALSE
		
		variantTranslation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
		var.addToVariantTranslations(variantTranslation)
		
		restaurantInstance.addToVariants(var)
		
		
		restaurantInstance.actionType = "NEW ACCOUNT CREATED"
        restaurantInstance.save flush:true
		flash.message = message(code: 'default.created.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), restaurantInstance.restaurantCode])
		redirect(action: 'edit', params: [id: restaurantInstance.id])
/*        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), restaurantInstance.restaurantCode])
                redirect restaurantInstance
            }
            '*' { respond restaurantInstance, [status: CREATED] }
        }*/
    }

    def edit(Restaurant restaurantInstance) {
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def restaurant = Staff.findByUser(user)?.restaurant
			if(restaurantInstance?.id.equals(restaurant.id)) {
				loadDefaultTranslation(restaurantInstance)
				respond restaurantInstance
			} else {
				redirect(uri: "/denied")
			}
		} else {
			loadDefaultTranslation(restaurantInstance)
			respond restaurantInstance
		}
    }

    @Transactional
    def update(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view:'edit'
            return
        }

		def translation = restaurantInstance.restaurantTranslations?.find {
			it.language.id == Constants.Languages.ENGLISH.getLanguagesId()}
		log.info "Translation: ${translation}"
		translation.title = params.title
		translation.description=params.description
		translation.showDescription=params.showDescription
		translation.save flush: true

		restaurantInstance.updatedBy = springSecurityService.principal.username
		restaurantInstance.actionType = "ACCOUNT UPDATED"

        restaurantInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.restaurantCode])
                redirect restaurantInstance
            }
            '*'{ respond restaurantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			
	        //restaurantInstance.delete flush:true
			restaurantInstance.accountDeleted = true
			restaurantInstance.updatedBy = springSecurityService.principal.username
			restaurantInstance.actionType = "ACCOUNT MARKED AS DELETED"
			restaurantInstance.save flush:true
	
	        request.withFormat {
	            form multipartForm {
	                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.id])
	                redirect action:"index", method:"GET"
	            }
	            '*'{ render status: NO_CONTENT }
	        }
		} else {
			flash.message = message(code: 'delete.notAllowed.message', default: 'Restaurant cannot be deleted. Please contact your administrator')
			redirect (action:"show", id: restaurantInstance.id)
		}
    }

	def loadImages() {
		log.info "Loading images for params: ${params}"
		def results = []
		params.serverPath = servletContext.contextPath
		results << restaurantManagementService.loadImages(params)
		def jsonData = [files: results]
		render jsonData as JSON
	}
	
	@Transactional
	def uploadImage() {
		log.info "Params for ${this}: ${params}"
		switch(request.method){
			case "POST":
				log.info "POST REQUEST"
				params.serverPath = servletContext.contextPath
				def results = []
				if (request instanceof MultipartHttpServletRequest){
					MultipartFile file
					for(filename in request.getFileNames()){
						file = request.getFile(filename)
						results << restaurantManagementService.saveImage(params, file)
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
		restaurantManagementService.deleteImage(params)
		def result = [success: true]
		render result as JSON
	}

	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurant.label', default: 'Restaurant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
