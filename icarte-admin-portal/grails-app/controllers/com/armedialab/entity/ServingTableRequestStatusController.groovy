package com.armedialab.entity

import grails.converters.JSON

import com.armedialab.ServingTableRequestManagementService

class ServingTableRequestStatusController {

	def springSecurityService
	def grailsApplication
	ServingTableRequestManagementService servingTableRequestManagementService
	
    def index() { 
		def results
		if(request.isUserInRole("ROLE_RESTAURANT_OWNER")){
			def user = springSecurityService.loadCurrentUser()
			results = Branch.findAll("from Branch b where b.restaurant=? and b.isActive = ? order by name asc",
					[Staff.findByUser(user)?.restaurant, true])
		}
		else if (request.isUserInRole("ROLE_SUPERADMIN")) {
			results = Branch.findAll("from Branch b where b.isActive = ? order by name asc",
				[true])
		}
		render (view: 'index', 
				model: [branches: results, 
						refreshInterval: grailsApplication.config.tableRequestStatusRefreshInterval?:60000])
	}
	
	def loadServingTableRequests(){
		def branch
		def user = springSecurityService.loadCurrentUser()
		def isAdmin = false
		def isOwner = false
		def isNormalStaff = false
		
		springSecurityService.authentication.authorities.each {
			if(it.authority == "ROLE_SUPERADMIN") {
				isAdmin = true
			} else {
				if (it.authority == "ROLE_RESTAURANT_OWNER") {
					isOwner = true
				} else {
					isNormalStaff = true
				}
			}
		}
		
		/**
		 * If admin, and the branch is not available in the request, don’t show any data.
		 * If restaurant owner, and the branch is not available in the request, don’t show any data.
		 * For all other users show their branch data.
		 */
		if(isNormalStaff) {
			branch = Staff.findByUser(user)?.branch
		} else if(params.branchId) { 
			branch = Branch.get(params.branchId)
		}
		def results = servingTableRequestManagementService.loadServingTableRequests(branch)
		def jsonData = [data: results, branch: branch?.id, state: "OK"]
		render jsonData as JSON
	}
	
	def dismissServingTableRequest(){
		if(params.id){
			if(servingTableRequestManagementService.dismissServingTableRequest(
						ServingTableRequestStatus.get(params.id)))
				render ([state: "OK"] as JSON)
			else
				render ([state: "FAIL"] as JSON)
		}
	}
}
