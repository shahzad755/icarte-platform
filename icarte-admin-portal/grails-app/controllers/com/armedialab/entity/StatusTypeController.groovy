package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StatusTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def filterPaneService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StatusType.list(params), model:[statusTypeInstanceCount: StatusType.count()]
    }

    def show(StatusType statusTypeInstance) {
        respond statusTypeInstance
    }

    def create() {
        respond new StatusType(params)
    }

    @Transactional
    def save(StatusType statusTypeInstance) {
        if (statusTypeInstance == null) {
            notFound()
            return
        }

        if (statusTypeInstance.hasErrors()) {
            respond statusTypeInstance.errors, view:'create'
            return
        }

        statusTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'statusType.label', default: 'StatusType'), statusTypeInstance.id])
                redirect statusTypeInstance
            }
            '*' { respond statusTypeInstance, [status: CREATED] }
        }
    }

    def edit(StatusType statusTypeInstance) {
        respond statusTypeInstance
    }

    @Transactional
    def update(StatusType statusTypeInstance) {
        if (statusTypeInstance == null) {
            notFound()
            return
        }

        if (statusTypeInstance.hasErrors()) {
            respond statusTypeInstance.errors, view:'edit'
            return
        }

        statusTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StatusType.label', default: 'StatusType'), statusTypeInstance.id])
                redirect statusTypeInstance
            }
            '*'{ respond statusTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StatusType statusTypeInstance) {

        if (statusTypeInstance == null) {
            notFound()
            return
        }
		statusTypeInstance.isActive = false
        statusTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StatusType.label', default: 'StatusType'), statusTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusType.label', default: 'StatusType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def filter = {
		if(!params.max) params.max = 10
		render( view:'index',
			model:[ statusTypeInstanceList: filterPaneService.filter( params, StatusType.class ),
			domainClassCount: filterPaneService.count( params, StatusType.class ),
			filterParams: org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params),
			params:params ] )
	}
}
