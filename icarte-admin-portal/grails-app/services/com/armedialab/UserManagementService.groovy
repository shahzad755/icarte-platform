package com.armedialab

import grails.transaction.Transactional

import com.armedialab.entity.Staff
import com.armedialab.user.Role;
import com.armedialab.user.User
import com.armedialab.user.UserRole;

@Transactional
class UserManagementService {

	def springSecurityService
	def grailsApplication
	
	def searchUsers(def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for users with  given search criteria:>${_criteria}")
		def criteria = User.createCriteria()
		def user = springSecurityService.loadCurrentUser()
		
		def authority = springSecurityService.authentication.authorities.find {
			it.authority == "ROLE_SUPERADMIN"
		}
		
		def users = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			//eq ("isActive", Boolean.FALSE)
			
            if(_criteria.data.username) {
                like ("username", _criteria.data.username+"%")
            }

            if(_criteria.data.email) {
                eq ("email", _criteria.data.email)
            }
            
            staff {
				//allow only users which belongs to user's restaurant
				if(!authority){
					if(log.isDebugEnabled()) {
						log.debug("User is not admin, only allow restaurant related data")
					}
					restaurant {
						eq ("id", user.staff?.restaurant.id)
					}
				}
	
                if(_criteria.data.staffCode) {
                    like ("staffCode", _criteria.data.staffCode.toUpperCase()+"%")
                }
                if(_criteria.data.mobile) {
                    eq ("mobile", _criteria.data.mobile.toUpperCase())
                }
            }


			// ----------------------- Sorting ----------------------
			//Handle Title as sorting column differently...
            if("branchCode".equals(_criteria.sortColumn)){
				staff {
	                branch {
	                    order ("branchCode", _criteria.sortOrder)
	                }
				}
            } else if("staffCode".equals(_criteria.sortColumn)){
				staff {
	                   	order ("staffCode", _criteria.sortOrder)
				}
            } else {
                order (_criteria.sortColumn, _criteria.sortOrder)
            }
		}
		
        def staff = null
        def results = users.collect {
            staff = it.staff
            [DT_RowId: "${it.id}",
                username: "${it.username}",
                staffCode: "${staff?.staffCode?:'-'}",
                firstName: "${it.firstName?:'-'}",
                lastName: "${it.lastName?:'-'}",
                mobile: "${staff.mobile?:'-'}",
                email: "${it.email?:'-'}",
                restaurant: "${staff?.restaurant.name?:'-'}",
                branch: "${staff?.branch.name?:'-'}",
                enabled: "${it.enabled}".capitalize(),
                id: "${it.id}"
            ]
        }

		def totalRows = users.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}
	
	def saveUserRoles(def data) {
		def userId = data.userId
		if(userId){
			User user = User.load(userId)
			UserRole.executeUpdate("delete from UserRole where user = ?", [user])
			if(data.userRoles instanceof String){//this is when only one addon is selected
				//new UserRole(user: user, role: Role.load(data.userRoles.toLong())).save(flush: true)
				UserRole.create (user, Role.load(data.userRoles.toLong()))
				return true
			} else {
				data.userRoles.each {
					UserRole.create (user, Role.load(it.toLong()))
				}
				return true
			 }

		} else {
			log.error("userId cannot be null")
			return false
		}
	}

	/**
	 * Validate if the password and confirmPassword matches, and that it complies with the password policy
	 * Password Policy: Password must follow the below rules: <br>1) 5 to 20 characters string with at least one digit <br>2) One upper case letter <br>3) One lower case letter <br>4) One special symbol from these: @#_& 
	 * @param user
	 * @param password
	 * @param newPassword
	 * @param confirmPassword
	 * @return true/false
	 */
	def validateChangePassword(def user, def password, def newPassword, def confirmPassword) {
		boolean isValid = true
		
		if (!password || !newPassword || !confirmPassword) {
			user.errors.rejectValue("password", "invalid.current.and.new.password")
			isValid = false
		}
		def passwordEncoder = springSecurityService.passwordEncoder

		// reject if the current password and new password are same
		if (passwordEncoder.isPasswordValid(user.password, newPassword, null /*salt*/)) {
			user.errors.rejectValue("password", "invalid.same.newPassword")
			isValid = false
		}
		
		if (!newPassword?.equals(confirmPassword)) {
			user.errors.rejectValue("password", "invalid.matchingpasswords")
			isValid = false
		}
		if(!newPassword?.matches(grailsApplication.config.passwordPattern)) {
			user.errors.rejectValue("password", "invalid.password")
			isValid = false
		}
		return isValid
	}

	/**
	 * Validates if the current password is valid
	 * @param user
	 * @param password
	 * @return true/false
	 */
	def validatePassword(def user, def password, def confirmPassword) {
		boolean isValid = true
		if (!password) {
			user.errors.rejectValue("password", "invalid.password")
			isValid = false
		} else {
			if (!password?.equals(confirmPassword)) {
				user.errors.rejectValue("password", "invalid.matchingpasswords")
				isValid = false
			}
			if(!password?.matches(grailsApplication.config.passwordPattern)) {
				user.errors.rejectValue("password", "invalid.password")
				isValid = false
			}
		}
		return isValid
	}
	
	def authenticateUser(def user, def password) {
		boolean isValid = true
		if (!password) {
			user.errors.rejectValue("password", "invalid.current.password")
			isValid = false
		}
		def passwordEncoder = springSecurityService.passwordEncoder

		// reject if the current password is not valid
		if (!passwordEncoder.isPasswordValid(user.password, password, null)) {
			user.errors.rejectValue("password", "invalid.current.password")
			isValid = false
		}
		return isValid
	}


}
