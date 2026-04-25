package icarte.portal

import grails.converters.JSON
import grails.validation.ValidationException;

class ErrorsController {

	def internalError () {
		String incidentId = System.currentTimeMillis()
		if(request.xhr) {
			def exception= request.exception
			log.error("########### Incident ID: ${incidentId} ########## \n Exception ->", exception)
			def jsonData = [:]
			def errs = [:]
			if(exception.cause instanceof ValidationException) {
				log.error "Validation exception caught in generic error controller"
				def e = (ValidationException)exception.cause
				errs = e.errors.allErrors.collect {
					[field: it.field, error: message(error:it, encodeAs:'HTML')]
				}
				jsonData = [errors: errs]
			}
			else {
				jsonData.errors = [["error": "INCIDENT ID:${incidentId} --- ${exception.message}"]]
			}
			jsonData.state = "FAIL"
			log.error jsonData
			response.status = response.SC_INTERNAL_SERVER_ERROR
			render jsonData as JSON
		} else {
			log.error("########### Incident ID: ${incidentId} ########## \n Exception ->", request.exception)
			render (view: '/error', model: [incidentId: incidentId])
		}
	}
}
