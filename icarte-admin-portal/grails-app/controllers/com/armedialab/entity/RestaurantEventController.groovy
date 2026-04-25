package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import com.armedialab.util.Constants

@Transactional(readOnly = true)
class RestaurantEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	def restaurantEventManagementService
	
    def index() {
		def results = loadRecords([max: 100, sort: "eventDate", order: "desc"])
		render (view: 'index', model: [restaurantEventInstanceList: results])
    }

	void loadDefaultTranslation(def restaurantEventInstance) {
		restaurantEventInstance.restaurantEventTranslations = RestaurantEventTranslation.findAllWhere(restaurantEvent: restaurantEventInstance,
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
	}
	
	def loadRecords(def _params) {
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = RestaurantEvent.findAll("from RestaurantEvent as r join r.restaurantEventTranslations rTrans where rTrans.language = ? ",
			[RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId())])
		} else {
			results = RestaurantEvent.findAll("from RestaurantEvent as r join r.restaurantEventTranslations rTrans where rTrans.language = ?  and r.restaurant = ?",
			[RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()),
				Staff.findByUser(user)?.restaurant])
		}

		return results
	}

    def show(RestaurantEvent restaurantEventInstance) {
		loadDefaultTranslation(restaurantEventInstance)
        respond restaurantEventInstance
    }

    def create() {
        respond new RestaurantEvent(params)
    }

    @Transactional
    def save(RestaurantEvent restaurantEventInstance) {
        if (restaurantEventInstance == null) {
            notFound()
            return
        }
		restaurantEventInstance.createdBy = springSecurityService.principal.username
		
		def translation = new RestaurantEventTranslation()
		translation.title = params.title
		translation.description = params.description
		translation.showDescription = true
		
		translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
		
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			restaurantEventInstance.restaurant = Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant
		}
		
		restaurantEventInstance.addToRestaurantEventTranslations(translation)

        if (restaurantEventInstance.hasErrors()) {
			
            respond restaurantEventInstance, view:'create'
            return
        }
        restaurantEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'restaurantEvent.label', default: 'RestaurantEvent'), translation.title])
                redirect restaurantEventInstance
            }
            '*' { respond restaurantEventInstance, [status: CREATED] }
        }
    }

    def edit(RestaurantEvent restaurantEventInstance) {
		loadDefaultTranslation(restaurantEventInstance)
        respond restaurantEventInstance
    }

    @Transactional
    def update(RestaurantEvent restaurantEventInstance) {
        if (restaurantEventInstance == null) {
            notFound()
            return
        }
		def translation = restaurantEventInstance.restaurantEventTranslations?.find {
			it.language.id == Constants.Languages.ENGLISH.getLanguagesId()}
		
		translation.title = params.title
		translation.description = params.description
		translation.save(flush: true)
		
		restaurantEventInstance.updatedBy = springSecurityService.principal.username

        if (restaurantEventInstance.hasErrors()) {
            respond restaurantEventInstance, view:'edit'
            return
        }

        restaurantEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RestaurantEvent.label', default: 'RestaurantEvent'), translation.title])
                redirect restaurantEventInstance
            }
            '*'{ respond restaurantEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RestaurantEvent restaurantEventInstance) {

        if (restaurantEventInstance == null) {
            notFound()
            return
        }

        restaurantEventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RestaurantEvent.label', default: 'RestaurantEvent'), restaurantEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	def loadImages() {
		if(log.isDebugEnabled())
			log.debug "Loading images for params: ${params}"
		def results = []
		params.serverPath = servletContext.contextPath
		results << restaurantEventManagementService.loadImages(params)
		def jsonData = [files: results]
		render jsonData as JSON
	}
	
	@Transactional
	def uploadImage() {
		if(log.isDebugEnabled())
			log.debug"Params : ${params}"
			
		switch(request.method){
			case "POST":
				params.serverPath = servletContext.contextPath
				def results = []
				if (request instanceof MultipartHttpServletRequest){
					MultipartFile file
					for(filename in request.getFileNames()){
						file = request.getFile(filename)
						results << restaurantEventManagementService.saveImage(params, file)
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
		restaurantEventManagementService.deleteImage(params)
		def result = [success: true]
		render result as JSON
	}
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurantEvent.label', default: 'RestaurantEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
