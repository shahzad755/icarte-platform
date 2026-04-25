package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import com.armedialab.reference.CuisineTypeManagementService
import com.armedialab.util.Constants

@Transactional(readOnly = true)
class CuisineTypeController {

    static allowedMethods = [save: "POST", update: "PUT", deleteImage: "DELETE", uploadImage: ["POST", "GET"]]
	def CuisineTypeManagementService cuisineTypeManagementService
	def springSecurityService
	
	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = CuisineType.findAll("from CuisineType as cuisineType join cuisineType.cuisineTranslations cTrans where cTrans.language = ?",
				[RefLanguage.load(
					Constants.Languages.ENGLISH.getLanguagesId())], 
					params)
		} else {
			results = CuisineType.findAll("from CuisineType as cuisineType join cuisineType.cuisineTranslations cTrans where cTrans.language = ? and cuisineType.restaurant = ?",
				[RefLanguage.load(
					Constants.Languages.ENGLISH.getLanguagesId()),
					Staff.findByUser(user)?.restaurant], 
					params)
		}
		render (view: 'index', model: [cuisineTypeInstanceList: results])
	}

    def show(CuisineType cuisineTypeInstance) {
		loadDefaultTranslation(cuisineTypeInstance)
        respond cuisineTypeInstance
    }

	void loadDefaultTranslation(def cuisineTypeInstance) {
		cuisineTypeInstance.cuisineTranslations = CuisineTranslation.findAllWhere(
			cuisineType: cuisineTypeInstance,
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
	}

    def create() {
		render (view: 'create', model: [cuisineTypeInstance: new CuisineType(params)])
    }

    @Transactional
    def save(CuisineType cuisineTypeInstance) {
        if (cuisineTypeInstance == null) {
            notFound()
            return
        }

        if (cuisineTypeInstance.hasErrors()) {
            respond cuisineTypeInstance.errors, view:'create'
            return
        }
		def translation = new CuisineTranslation()
		translation.title = params.title
		translation.description=params.description
		translation.showDescription=params.showDescription
		translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
		cuisineTypeInstance.createdBy = springSecurityService.principal.username
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			//TODO: for admin there should be a provision in the UI to specify restaurant id
			if(log.isDebugEnabled())
				log.debug "SUPER_ADMIN role is not associated with any restaurant"
		} else {
			cuisineTypeInstance.restaurant = Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant
		}
		cuisineTypeInstance.addToCuisineTranslations(translation)


        cuisineTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cuisineType.label', default: 'Cuisine Type'), translation.title])
                redirect cuisineTypeInstance
            }
            '*' { respond cuisineTypeInstance, [status: CREATED] }
        }
    }

    def edit(CuisineType cuisineTypeInstance) {
		loadDefaultTranslation(cuisineTypeInstance)
        respond cuisineTypeInstance
    }

    @Transactional
    def update(CuisineType cuisineTypeInstance) {
        if (cuisineTypeInstance == null) {
            notFound()
            return
        }

        if (cuisineTypeInstance.hasErrors()) {
            respond cuisineTypeInstance.errors, view:'edit'
            return
        }
		def translation = cuisineTypeInstance.cuisineTranslations?.find {
			it.language.id == Constants.Languages.ENGLISH.getLanguagesId()}
		
		translation.title = params.title
		translation.description = params.description
		
		cuisineTypeInstance.updatedBy = springSecurityService.principal.username

        cuisineTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CuisineType.label', default: 'Cuisine Type'), translation?.title])
                redirect cuisineTypeInstance
            }
            '*'{ respond cuisineTypeInstance, [status: OK] }
        }
    }
	
	def loadImages() {
		if(log.isDebugEnabled())
			log.debug "Loading images for params: ${params}"
		def results = []
		params.serverPath = servletContext.contextPath
		results << cuisineTypeManagementService.loadImages(params)
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
						results << cuisineTypeManagementService.saveImage(params, file)
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
		cuisineTypeManagementService.deleteImage(params)
		def result = [success: true]
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
