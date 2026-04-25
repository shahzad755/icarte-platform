package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import com.armedialab.util.Constants

@Transactional(readOnly = true)
class FeedbackConfigController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def propertiesToRender = ['title', 'feedbackType', 'description', 'isRequired', 'isActive']
	
	def springSecurityService
	def feedbackManagementService
	
    def index() {
    }
	
	def list() {
		log.info("FeedbackController Grid requested")
	
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		if(log.isDebugEnabled()) {
			log.debug("Sort Order: ${sortOrder} Sort Col: ${sortColumn} Max Rows: ${maxRows} Row offset: ${rowOffset} Filter: ${params.sSearch}")
		}
		def results = feedbackManagementService.searchFeedbackConfig(
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON

	}


    def show(FeedbackConfig feedbackConfigInstance) {
		loadDefaultTranslation(feedbackConfigInstance)
        respond feedbackConfigInstance
    }

    def create() {
        //respond new FeedbackConfig(params)
		render (view: 'create', model:[feedbackConfigInstance: new FeedbackConfig(params)])
    }

	void loadDefaultTranslation(def feedbackConfigInstance) {
		feedbackConfigInstance.feedbackConfigTranslations = FeedbackConfigTranslation.findAllWhere(feedbackConfig: feedbackConfigInstance,
			language: RefLanguage.load(
				Constants.Languages.ENGLISH.getLanguagesId()))
	}
	
    @Transactional
    def save(FeedbackConfig feedbackConfigInstance) {
        if (feedbackConfigInstance == null) {
            notFound()
            return
        }

        if (feedbackConfigInstance.hasErrors()) {
            respond feedbackConfigInstance.errors, view:'create'
            return
        }
		
		def translation = new FeedbackConfigTranslation()
		translation.title = params.title
		translation.description = params.description
		translation.showDescription = false
		translation.isDefault = true
		
		translation.language = RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())
		def user = springSecurityService.loadCurrentUser()
		feedbackConfigInstance.createdBy = springSecurityService.principal.username
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			feedbackConfigInstance.restaurant = Staff.findByUser(user)?.restaurant
		}

		feedbackConfigInstance.addToFeedbackConfigTranslations(translation)
        feedbackConfigInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'feedbackConfig.label', default: 'Feedback Configuration'), translation.title])
                redirect feedbackConfigInstance
            }
            '*' { respond feedbackConfigInstance, [status: CREATED] }
        }
    }

    def edit(FeedbackConfig feedbackConfigInstance) {
		loadDefaultTranslation(feedbackConfigInstance)
		def results = FeedbackConfigTranslation.findAllByFeedbackConfig(feedbackConfigInstance)
		render (view: 'edit', model: [feedbackConfigInstance: feedbackConfigInstance, feedbackConfigInstanceList: results])
    }

    @Transactional
    def update(FeedbackConfig feedbackConfigInstance) {
        if (feedbackConfigInstance == null) {
            notFound()
            return
        }

        if (feedbackConfigInstance.hasErrors()) {
            respond feedbackConfigInstance.errors, view:'edit'
            return
        }

		loadDefaultTranslation(feedbackConfigInstance)
		def translation = feedbackConfigInstance.translation
		translation.title = params.title
		translation.description = params.description
		translation.save flush: true
		
		feedbackConfigInstance.updatedBy = springSecurityService.principal.username
        feedbackConfigInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'feedbackConfig.label', default: 'Feedback Configuration'),
					translation?.title])
                redirect feedbackConfigInstance
            }
            '*'{ respond feedbackConfigInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FeedbackConfig feedbackConfigInstance) {

        if (feedbackConfigInstance == null) {
            notFound()
            return
        }
		feedbackConfigInstance.updatedBy = springSecurityService.principal.username
        feedbackConfigInstance.isActive = false

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deactivated.message', args: [message(code: 'feedbackConfig.label', default: 'Feedback Configuration'),
						feedbackConfigInstance.getDefaultTitle()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'addon.label', default: 'Addon'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
