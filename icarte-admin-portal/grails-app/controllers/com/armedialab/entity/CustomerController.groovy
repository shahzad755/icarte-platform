package com.armedialab.entity



import static org.springframework.http.HttpStatus.*

import java.util.Map;

import grails.converters.JSON
import grails.transaction.Transactional

import com.armedialab.CustomerManagementService

@Transactional(readOnly = true)
class CustomerController {

	static allowedMethods = [save: "POST", update: "PUT", deactivateCustomer: "DELETE", list: "POST"]
	def propertiesToRender = ['code', 'firstName', 'lastName', 'mobile', 'email', 'isActive', 'restaurant']
	def springSecurityService
	def grailsApplication
	def CustomerManagementService customerManagementService
	
    def index(Integer max) {
    }

	def list() {
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[1]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		def results = customerManagementService.searchCustomer (
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON

	}
	
    def show(Customer customerInstance) {
        respond customerInstance
    }

	def create() {
		render (view: 'create', model: [customerInstance: new Customer(params)])
	}

	@Transactional
	def save() {
		if(log.isDebugEnabled())
			log.debug("Params for customer->save: ${params}")
			
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		def id
		def op = params.id ? "Updated" : "Added"
		def customerInstance = customerManagementService.saveCustomer(params)
		
		if(customerInstance) {
			if(request.xhr) {
				if(!customerInstance.hasErrors()) {
					msg = "Customer ${customerInstance.firstName?:''} ${customerInstance.lastName?:''} ${op} successfully"
					id = customerInstance.id
					state = "OK"
				}
				else {
					// Capture any validation messages to display on the client side
					response.status = response.SC_INTERNAL_SERVER_ERROR
					errs = customerInstance.errors.allErrors.collect {
						log.debug("Error:[${it}]")
						[field: it.field, error: message(error:it, encodeAs:'HTML')]
					}
				}
				def jsonData = [message: msg, errors: errs, state: state, id: id]
				render jsonData as JSON
			} else {
				if (customerInstance.hasErrors()) {
					if (customerInstance.id)
						respond customerInstance.errors, view:'edit'
					else 
						respond customerInstance.errors, view:'create'
				} else {
					request.withFormat {
						form multipartForm {
							flash.message = message(code: 'default.saved.message', args: [message(code: 'Customer.label', default: 'Customer'), "${customerInstance.firstName?:''} ${customerInstance.lastName?:''}"])
							redirect customerInstance
						}
						'*'{ respond customerInstance, [status: OK] }
					}
				}
			}
		} else {
			if(request.xhr) {
				response.status = response.SC_NOT_FOUND
				render noRecord("Customer", null) as JSON
			} else {
				notFound()
				return
			}
		}
	}

    def edit(Customer customerInstance) {
        respond customerInstance
    }

    @Transactional
    def update(Customer customerInstance) {
        if (customerInstance == null) {
            notFound()
            return
        }

        if (customerInstance.hasErrors()) {
            respond customerInstance.errors, view:'edit'
            return
        }

        customerInstance = customerManagementService.saveCustomer(params)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Customer.label', default: 'Customer'), "${customerInstance.firstName?:''} ${customerInstance.lastName?:''}"])
                redirect customerInstance
            }
            '*'{ respond customerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Customer customerInstance) {

        if (customerInstance == null) {
            notFound()
            return
        }
		customerInstance.isActive = false
        customerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deactivated.message', args: [message(code: 'Customer.label', default: 'Customer'), "${customerInstance.firstName?:''} ${customerInstance.lastName?:''}"])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
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
}
