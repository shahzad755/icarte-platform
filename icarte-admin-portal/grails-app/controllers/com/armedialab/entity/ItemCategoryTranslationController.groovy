package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import java.text.SimpleDateFormat

import com.armedialab.reference.ItemCategoryManagementService;
import com.armedialab.reference.TranslationSearchService;
import com.armedialab.util.Constants;

@Transactional(readOnly = true)
class ItemCategoryTranslationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def propertiesToRender = ['title', 'language', 'description', 'showDescription']
	def TranslationSearchService translationSearchService
	
    def list() {
		log.info("ItemCategoryTranslationController Grid requested")
	
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		if(log.isDebugEnabled()) {
			log.debug("Sort Order: ${sortOrder} Sort Col: ${sortColumn} Max Rows: ${maxRows} Row offset: ${rowOffset} Filter: ${params.sSearch}")
		}
		def results = translationSearchService.searchItemCategoryTranslation(
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON

    }

	def edit(ItemCategoryTranslation itemCategoryTranslationInstance) {
		respond itemCategoryTranslationInstance
	}

    def show(ItemCategoryTranslation itemCategoryTranslationInstance) {
        respond itemCategoryTranslationInstance
    }

    def create() {
		log.info("Params for itemCategoryTranslation: ${params}")
		def trans = new ItemCategoryTranslation(params)
        respond trans
    }

    @Transactional
    def save(ItemCategoryTranslation itemCategoryTranslationInstance) {
		log.info("Params for itemCategoryTranslation: ${params}")
		
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		def id
		
        if (itemCategoryTranslationInstance == null) {
            render noRecord("Translation", null) as JSON
        } else {
	
			
	        if (itemCategoryTranslationInstance.hasErrors()) {
				response.status = response.SC_INTERNAL_SERVER_ERROR
				errs = itemCategoryTranslationInstance.errors.allErrors.collect {
					log.debug("Error:[${it}]")
					[field: it.field, error: message(error:it, encodeAs:'HTML')]
				}
				def jsonData = [message: msg, errors: errs, state: state, id: id]
				render jsonData as JSON
	
	        } else {
		        itemCategoryTranslationInstance.save flush:true
				if(itemCategoryTranslationInstance) {
					if(!itemCategoryTranslationInstance.hasErrors()) {
						def op = params.id ? "Updated" : "Added"
						msg = "Translation \"${itemCategoryTranslationInstance.title}\" ${op} successfully"
						id = itemCategoryTranslationInstance.id
						state = "OK"
					}
					else {
						// Capture any validation messages to display on the client side
						response.status = response.SC_INTERNAL_SERVER_ERROR
						errs = itemCategoryTranslationInstance.errors.allErrors.collect {
							log.debug("Error:[${it}]")
							[field: it.field, error: message(error:it, encodeAs:'HTML')]
						}
					}
					log.debug("ItemCategoryTranslation result after processing: ${msg}")
					def jsonData = [message: msg, errors: errs, state: state, id: id]
					render jsonData as JSON
		
				} else {
					response.status = response.SC_NOT_FOUND
					render noRecord(id) as JSON
				}
	        }
        }
    }

    @Transactional
    def delete() {
		log.debug "Deleting translation with id: ${params.id}"
		def msg = ""
		def errs = [:]
		def state = "FAIL"

		if(params.id) {
			def translation = ItemCategoryTranslation.get(params.id.trim())
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
						message(code: 'itemCategoryTranslation.label', default: name),id])
						]]
		else
			error =  [["error":	 "Request parameter 'id' is null"]]
		return [errors: error, state: response.SC_NOT_FOUND]
	}

}
