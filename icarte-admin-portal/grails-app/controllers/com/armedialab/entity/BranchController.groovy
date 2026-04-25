package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BranchController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def springSecurityService
	
/*    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Branch.list(params), model:[branchInstanceCount: Branch.count()]
    }
*/

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def user = springSecurityService.loadCurrentUser()
		
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			if(params.restaurantId) {
				results = Branch.findAllByRestaurant(Restaurant.load(params.restaurantId), params)
			} else {
				results = Branch.list(params)
			}
		} else {
			 Restaurant restaurant = Restaurant.get(Staff.findByUser(user)?.restaurant?.id)
			 results = Branch.findAllByRestaurant(restaurant, params)
		 }
		 render (view: 'index', model: [branchInstanceList: results, branchInstanceCount: Branch.count()])
	}

    def show(Branch branchInstance) {
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def restaurant = Staff.findByUser(user)?.restaurant
			if(branchInstance.restaurant.id.equals(restaurant.id)) {
				respond branchInstance
			} else {
				redirect(uri: "/denied")
			}
		} else {
			respond branchInstance
		}
        respond branchInstance
    }

    def create() {
        respond new Branch(params)
    }

    @Transactional
    def save(Branch branchInstance) {
        if (branchInstance == null) {
            notFound()
            return
        }

        if (branchInstance.hasErrors()) {
            respond branchInstance.errors, view:'create'
            return
        }

		branchInstance.createdBy = springSecurityService.principal.username
		
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			branchInstance.restaurant = Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant
		}

        branchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'branch.label', default: 'Branch'), branchInstance.name])
                redirect branchInstance
            }
            '*' { respond branchInstance, [status: CREATED] }
        }
    }

    def edit(Branch branchInstance) {
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			def user = springSecurityService.loadCurrentUser()
			def restaurant = Staff.findByUser(user)?.restaurant
			if(branchInstance.restaurant.id.equals(restaurant.id)) {
				respond branchInstance
			} else {
				redirect(uri: "/denied")
			}
		} else {
        	respond branchInstance
		}

    }

    @Transactional
    def update(Branch branchInstance) {
        if (branchInstance == null) {
            notFound()
            return
        }

        if (branchInstance.hasErrors()) {
            respond branchInstance.errors, view:'edit'
            return
        }
		branchInstance.updatedBy = springSecurityService.principal.username
		
        branchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Branch.label', default: 'Branch'), branchInstance.name])
                redirect branchInstance
            }
            '*'{ respond branchInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Branch branchInstance) {

        if (branchInstance == null) {
            notFound()
            return
        }

		branchInstance.isActive = false
        branchInstance.updatedBy = springSecurityService.principal.username
		branchInstance.save flush:true
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Branch.label', default: 'Branch'), branchInstance.name])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'branch.label', default: 'Branch'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
