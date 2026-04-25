package com.armedialab.user

import grails.converters.JSON
import grails.transaction.Transactional

import com.armedialab.UserManagementService
import com.armedialab.entity.Branch
import com.armedialab.entity.FeedbackConfig;
		
@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def propertiesToRender = ['username', 'staffCode', 'firstName', 'lastName', 'mobile', 'email', 'restaurantCode', 'branchCode', 'isActive']
	def springSecurityService
	def grailsApplication
	def UserManagementService userManagementService
	
	def index() {
		render (view: 'index', model: [])
    }

    def list() {
    	if(log.isDebugEnabled())
    		log.debug("Users Controller Grid requested with params${params}")
    		
    		def sortParam = params['order[0][column]']?.toInteger()
			
			def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[0]
			def sortOrder  = params['order[0][dir]'] ?: 'desc'
						
			def maxRows = params.int('length')?:10;
			def rowOffset = params.int('start')?:0;
			
			def results = userManagementService.searchUsers (
					[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
					
			def jsonData = [draw: params.draw,
			                total: results.numberOfPages,
			                recordsTotal: results.totalRows,
			                recordsFiltered: results.totalRows,
			                data: results.records]
			                		render jsonData as JSON
    						                		
    }
	
	def loadBranchList() {
		def user = springSecurityService.loadCurrentUser()
		def branchList = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			branchList = Branch.findAll("from Branch b where b.isActive = ?", [true])
		} else {
			branchList = Branch.findAll("from Branch b where b.isActive = ? and b.restaurant = ?",
					[true, user.staff.restaurant])
		}
		return branchList
	}
	

	def create() {
		render (view: 'create', model:[userInstance: new User(), branchList: loadBranchList()])
	}

    @Transactional
	def save(User userInstance) {
		def isEditMode = userInstance.id? true: false
		if(log.isDebugEnabled()) {
			log.debug("Saving user")
		}
		if (userInstance == null) {
			notFound()
			return
		}
		
		if(!isEditMode) {
			userManagementService.validatePassword(userInstance, params.password, params.confirmPassword)
			userInstance.confirmPassword = params.confirmPassword
		}
		
/*		if(!request.isUserInRole("ROLE_SUPERADMIN")) {
			log.debug "User......... ${userInstance}"
			log.debug "Staff......... ${userInstance.staff}"
			log.debug "Staff Branch......... ${userInstance.staff.branch}"
			def staff = userInstance.staff
			staff.restaurant = userInstance.staff.branch?.restaurant
			log.debug "Setting restaurant as......... ${staff.restaurant}"
			userInstance.staff = staff
		}
*/
		if (userInstance.hasErrors()) {
			userInstance.errors.allErrors.each {
				println it
			}
			
			render (view: isEditMode? 'edit': 'create', model:[userInstance: userInstance, branchList: loadBranchList()])
			return
		}
		
		if(isEditMode) {
			userInstance.updatedBy = springSecurityService.principal.username
		} else {
			userInstance.createdBy = springSecurityService.principal.username
		}
		userInstance.save(flush: true)

		request.withFormat {
			form multipartForm {
				flash.message = message(code: isEditMode? 'default.updated.message': 'default.created.message', 
					args: [message(code: 'user.label', default: 'User'), 
						userInstance.username])
				//redirect userInstance
				redirect (action: "edit", id: userInstance.id, userInstance: userInstance)
			}
			'*' { respond userInstance, [status: isEditMode? OK: CREATED] }
		}

	}

/*	def show(User userInstance) {
		respond userInstance
	}

*/	def edit(User userInstance) {
		render (view: 'edit', model:[userInstance: userInstance, branchList: loadBranchList()])
	}
	
    @Transactional
	def update(User userInstance) {
		save(userInstance)
	}
	
	@Transactional
	def userRoles() {
		def user = User.get(params.id)
		render (view: 'userRoles', model: [userInstance: user,
				roles: Role.findAll("from Role r where r.isActive=? and r.authority != ?", [true, 'ROLE_SUPERADMIN'])])
	}
	
	@Transactional
	def saveUserRoles() {
		if(log.isDebugEnabled())
		log.debug("Params for item addon: ${params}")
		
	def msg = ""
	def errs = [:]
	def state = "FAIL"
	def id
	
	def isSuccess = userManagementService.saveUserRoles(params)
	
	if(isSuccess) {
			msg = "User roles updated successfully.."
			state = "OK"
		}
		else {
			// Capture any validation messages to display on the client side
			response.status = response.SC_INTERNAL_SERVER_ERROR
			errs =  [["error":	 "An error occured while processing your request. Please contact administrator!"]]
		}
		if(log.isDebugEnabled())
			log.debug("UserRole.save result after processing: ${msg}")
		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}
	
	def profile() {
		def user = springSecurityService.loadCurrentUser()
		render (view: 'profile', model:[userInstance: user])
	}
	
	@Transactional
	def updateProfile() {
		def user = springSecurityService.loadCurrentUser()
		user.properties['email', 'firstName', 'lastName', 'staff.mobile'] = params
		
		if(user.validate() && user.save(flush: true)) {
				flash.message = message(code: 'userProfile.updated')
				redirect (action: "profile", userInstance: user)
		} else {
			render (view: 'profile', model:[userInstance: user])
		}
	}

	@Transactional
	def changePassword() {
		def user = springSecurityService.loadCurrentUser()
		//log.debug("Start")
		String password = params.oldPassword
		String newPassword = params.password
		String newPassword2 = params.confirmPassword
		
		// validate if the newPassword1 and newPassword2 are same and follows the password policy 
		if(userManagementService.validateChangePassword(user, password, newPassword, newPassword2)) {
			user.password = newPassword
			user.confirmPassword = newPassword2
		}
		if(user.hasErrors()) {
			render (view: 'profile', model:[userInstance: user, tab: "tab_changePassword"])
			return
		}

		user.save(flush: true)
		flash.message = message(code: 'userPassword.changed', )
		redirect (action: "profile", userInstance: user)

	}

}
