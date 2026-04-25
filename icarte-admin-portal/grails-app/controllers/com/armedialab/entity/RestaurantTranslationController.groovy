package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import com.armedialab.reference.TranslationSearchService
import com.armedialab.util.Constants

@Transactional(readOnly = true)
class RestaurantTranslationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def propertiesToRender = ['title', 'language', 'description', 'showDescription']
	def TranslationSearchService translationSearchService

	def list() {
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		if(log.isDebugEnabled()) {
			log.debug("Sort Order: ${sortOrder} Sort Col: ${sortColumn} Max Rows: ${maxRows} Row offset: ${rowOffset} Filter: ${params.sSearch}")
		}
		def results = translationSearchService.searchRestaurantTranslation(
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON
	}

    def create() {
        //respond new RestaurantTranslation(params)
		render (view: 'create', model: [translationInstance: new RestaurantTranslation(params)])
    }

    @Transactional
    def save(RestaurantTranslation restaurantTranslationInstance) {
		log.info("Params for Translation: ${params}")
		
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		def id
		
        if (restaurantTranslationInstance == null) {
            render noRecord("Translation", null) as JSON
        } else {
	        if (restaurantTranslationInstance.hasErrors()) {
				response.status = response.SC_INTERNAL_SERVER_ERROR
				errs = restaurantTranslationInstance.errors.allErrors.collect {
					log.debug("Error:[${it}]")
					[field: it.field, error: message(error:it, encodeAs:'HTML')]
				}
				def jsonData = [message: msg, errors: errs, state: state, id: id]
				render jsonData as JSON
	
	        } else {
		        restaurantTranslationInstance.save flush:true
				if(restaurantTranslationInstance) {
					if(!restaurantTranslationInstance.hasErrors()) {
						def op = params.id ? "Updated" : "Added"
						msg = "Translation \"${restaurantTranslationInstance.title}\" ${op} successfully"
						id = restaurantTranslationInstance.id
						state = "OK"
					}
					else {
						// Capture any validation messages to display on the client side
						response.status = response.SC_INTERNAL_SERVER_ERROR
						errs = restaurantTranslationInstance.errors.allErrors.collect {
							log.debug("Error:[${it}]")
							[field: it.field, error: message(error:it, encodeAs:'HTML')]
						}
					}
					def jsonData = [message: msg, errors: errs, state: state, id: id]
					render jsonData as JSON
		
				} else {
					response.status = response.SC_NOT_FOUND
					render noRecord(id) as JSON
				}
	        }
        }
    }

    def edit(RestaurantTranslation restaurantTranslationInstance) {
        //respond restaurantTranslationInstance
		render (view: 'edit', model: [translationInstance: restaurantTranslationInstance])
    }

    @Transactional
    def delete() {
		log.debug "Deleting translation with id: ${params.id}"
		def msg = ""
		def errs = [:]
		def state = "FAIL"

		if(params.id) {
			def translation = RestaurantTranslation.load(params.id.trim())
			if(translation != null) {
				if(Constants.Languages.ENGLISH.getLanguagesId().equals(translation.language.id)) {
					def jsonData = [message: msg, errors: [["error":"Default Langugage (English)  must not be deleted!"]], state: state]
					render jsonData as JSON
				} else {
					
						log.debug "Translation with id: ${translation.id} to be deleted"
						translation.delete(flush: true)
						state = "OK"
						msg = "Translation deleted successfully!"
						def jsonData = [message: msg, errors: errs, state: state]
						render jsonData as JSON
				}
			} else {
				render noRecord(params.id, "Translation", messageSource, response.SC_NOT_FOUND) as JSON
			}

		}
    }

	private Map noRecord(name, id) {
		log.debug "Record with name ${name}, id: ${id} not found"
		
		def error
		if(id)
			error = [["error":	 message(code: 'default.not.found.message', args: [
						message(code: 'label', default: name),id])
						]]
		else
			error =  [["error":	 "Request parameter 'id' is null"]]
		return [errors: error, state: response.SC_NOT_FOUND]
	}

}
