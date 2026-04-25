package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MenuController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 200)
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = Menu.findAll("from Menu m where m.isDeleted=?", [false], params)
		} else if(request.isUserInRole("ROLE_RESTAURANT_OWNER")) {
			results = Menu.findAll("from Menu m where m.isDeleted = ? and m.restaurant = ?", 
				[false, Staff.findByUser(user)?.restaurant], 
				params)
		} else {
			results = Menu.findAll("from Menu m where m.isDeleted = ? and m.branch = ?",
				[false, Staff.findByUser(user)?.branch],
				params)
		}

        respond results, 
			model:[menuInstanceCount: Menu.count()]
    }

    def show(Menu menuInstance) {
        respond menuInstance
    }

    def create() {
        //respond new Menu(params)
		render (view: 'create', model: [menuInstance: new Menu(params), branchList: loadBranchList()])
    }

    @Transactional
    def save(Menu menuInstance) {
		if(log.isDebugEnabled()) {
			log.debug("Params ${params}")
		}
        if (menuInstance == null) {
            notFound()
            return
        }

        if (menuInstance.hasErrors()) {
            respond menuInstance.errors, view:'create'
            return
        }

		def user = springSecurityService.loadCurrentUser()
		menuInstance.createdBy = springSecurityService.principal.username
		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			menuInstance.restaurant = Staff.findByUser(user)?.restaurant
		}
		menuInstance.actionType = "CREATED"
		menuInstance.isDeleted = false
        menuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.title])
                redirect menuInstance
            }
            '*' { respond menuInstance, [status: CREATED] }
        }
    }

    def edit(Menu menuInstance) {
        //respond menuInstance
		render (view: 'edit', model: [menuInstance: menuInstance, branchList: loadBranchList()])
		
    }

	def loadBranchList() {
		
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = Branch.findAll("from Branch b where b.isActive = ? order by name asc", [true])
		} else {
			results = Branch.findAll("from Branch b where b.restaurant=? and b.isActive = ? order by name asc",
					[Staff.findByUser(user)?.restaurant, true])
		}
		return results
	}
	
    @Transactional
    def update(Menu menuInstance) {
		if(log.isDebugEnabled()) {
			log.debug("Params ${params}")
		}

        if (menuInstance == null) {
            notFound()
            return
        }

        if (menuInstance.hasErrors()) {
            respond menuInstance.errors, view:'edit'
            return
        }
		menuInstance.updatedBy = springSecurityService.principal.username
		menuInstance.actionType = "MODIFIED"
        menuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Menu.label', default: 'Menu'), menuInstance.title])
                redirect menuInstance
            }
            '*'{ respond menuInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Menu menuInstance) {

        if (menuInstance == null) {
            notFound()
            return
        }

		menuInstance.isDeleted = true
		menuInstance.updatedBy = springSecurityService.loadCurrentUser().username
		menuInstance.actionType = "DELETED"
        menuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Menu.label', default: 'Menu'), menuInstance.title])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
