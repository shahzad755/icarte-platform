package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ServingTableController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def propertiesToRender = ['tableRefNumber', 'floor', 'branch']
	def springSecurityService
	
    def index() {
		def results = loadRecords(params)
        render (view: 'index', model: [servingTableInstanceList: results])
    }

    def show(ServingTable servingTableInstance) {
        respond servingTableInstance
    }

    def create() {
        //respond new ServingTable(params), branchList: loadBranchList()
		render (view: 'create', model: [servingTableInstance: new ServingTable(params), branchList: loadBranchList()])
    }

    @Transactional
    def save(ServingTable servingTableInstance) {
		if(log.isDebugEnabled())
			log.debug("Params: ${params}")
        if (servingTableInstance == null) {
            notFound()
            return
        }

        if (servingTableInstance.hasErrors()) {
            respond (servingTableInstance.errors, [view:'create', model:['branchList': loadBranchList()]])
            return
        }
/*		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			servingTableInstance.restaurant = servingTableInstance.branch?.restaurant
		} else {
			servingTableInstance.restaurant = Staff.findByUser(springSecurityService.loadCurrentUser())?.restaurant
		}
*/        servingTableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'servingTable.label', default: 'ServingTable'), servingTableInstance.tableRefNumber])
                redirect servingTableInstance
            }
            '*' { respond servingTableInstance, [status: CREATED] }
        }
    }

    def edit(ServingTable servingTableInstance) {
        //respond servingTableInstance, branchList: loadBranchList()
		render (view: 'edit', model: [servingTableInstance: servingTableInstance, branchList: loadBranchList()])
    }

    @Transactional
    def update(ServingTable servingTableInstance) {
        if (servingTableInstance == null) {
            notFound()
            return
        }
        if (servingTableInstance.hasErrors()) {
			respond (servingTableInstance.errors, [view:'edit', model:['branchList': loadBranchList()]])
            return
        }
        servingTableInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ServingTable.label', default: 'ServingTable'), servingTableInstance.tableRefNumber])
                redirect servingTableInstance
            }
            '*'{ respond servingTableInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ServingTable servingTableInstance) {

        if (servingTableInstance == null) {
            notFound()
            return
        }

		servingTableInstance.isActive = false
        servingTableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deactivated.message', args: [message(code: 'ServingTable.label', default: 'Serving Table'), servingTableInstance.tableRefNumber])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
	
	def loadRecords(def _params) {
		
/*		def sortParam = params['order[0][column]']?.toInteger()
		
		def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'

		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
*/
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = ServingTable.list(/*max: maxRows, offset: rowOffset, sort: sortColumn, order: sortOrder*/)
		} 
		if(request.isUserInRole("ROLE_RESTAURANT_OWNER")) {
			results =  ServingTable.findAll("from ServingTable where branch.restaurant = ?",
                [Staff.findByUser(user)?.restaurant]/*, max: maxRows, offset: rowOffset, sort: sortColumn, order: sortOrder*/)
		} else {
			results = ServingTable.findAll("from ServingTable as st where st.branch = ?",
			[Staff.findByUser(user)?.branch]/*, max: maxRows, offset: rowOffset, sort: sortColumn, order: sortOrder*/)
		}
		return results
	}
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'servingTable.label', default: 'ServingTable'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
