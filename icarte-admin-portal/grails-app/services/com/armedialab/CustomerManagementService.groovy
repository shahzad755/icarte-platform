package com.armedialab

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

import com.armedialab.entity.Customer
import com.armedialab.entity.Restaurant
import com.armedialab.entity.Staff
import com.armedialab.util.IDUtils

@Transactional
class CustomerManagementService {
	def springSecurityService
	def grailsApplication
	
	
	def searchCustomer(def _criteria) {
		if(log.isDebugEnabled())
			log.debug("Searching for customers with given search criteria:>${_criteria}")
		def criteria = Customer.createCriteria()
		def user = springSecurityService.loadCurrentUser()
		
		def authority = springSecurityService.authentication.authorities.find {
			it.authority == "ROLE_SUPERADMIN"
		}
		def items = criteria.list(max:_criteria.maxRows, offset:_criteria.rowOffset) {
	
			//eq ("isDeleted", Boolean.FALSE)
			//allow only customers which belongs to user's restaurant
			if(!authority){
				if(log.isDebugEnabled()) {
					log.debug("User is not admin, only allow restaurant customer")
				}
				restaurant {
					eq ("id", Staff.findByUser(user)?.restaurant.id)
				}
			}

			if(_criteria.data.searchCode) {
				eq ("code", _criteria.data.searchCode.toUpperCase())
			}

			if(_criteria.data.searchMobile) {
				eq ("mobile", _criteria.data.searchMobile)
			}

			if(_criteria.data.searchFname) {
				eq ("firstName", _criteria.data.searchFname.toUpperCase())
			}

			if(_criteria.data.searchLname) {
				eq ("lastName", _criteria.data.searchLname.toUpperCase())
			}
			
			if(_criteria.data.searchIsActive) {
				eq ("isActive", _criteria.data.searchIsActive.toBoolean())
			}
			order (_criteria.sortColumn, _criteria.sortOrder)
			
		}
		def results = items.collect {
			[DT_RowId: "${it.id}",
				code: "${it.code?:'-'}",
				firstName: "${it.firstName?:'-'}",
				lastName: "${it.lastName?:'-'}",
				mobile: "${it.mobile?:'-'}",
				email: "${it.email?:'-'}",
				isActive: "${it.isActive?'Yes':'No'}",
				restaurant: "${it.restaurant.restuarantNameWithCode}",
				id: "${it.id}"]
		}

		def totalRows = items.totalCount
		def numberOfPages = Math.ceil(totalRows / _criteria.maxRows)

		if(log.isDebugEnabled()){
			log.debug("Total Records found [${totalRows}], numberOfPages: ${numberOfPages}")
		}

		return ["totalRows": totalRows,
			"records": results,
			"numberOfPages": numberOfPages]
	}

    def saveCustomer(def data) {
		if(log.isDebugEnabled())
			log.debug("Save Customer with data: ${data}")
		
		def customerInstance
		def user = springSecurityService.loadCurrentUser()
		def restaurant = null;
		boolean isAdmin = SpringSecurityUtils.ifAnyGranted("ROLE_SUPERADMIN")
		
		if(!isAdmin) {
			restaurant = Staff.findByUser(user)?.restaurant
		} else {
			restaurant = Restaurant.load(data["restaurant.id"]?.toLong())
		}
	
		if(data.id) {
			if(log.isDebugEnabled())
				log.debug("Edit Customer with id ${data.id}")

			customerInstance = Customer.get(data.id.toLong())
			if(customerInstance) {
				customerInstance.properties["mobile", "firstName", "lastName", "email", "isActive", "subscribeNewsLetter", "restaurant"] = data
				customerInstance.updatedBy = springSecurityService.principal.username
			} else {
				log.error ("No Customer found for given id: ${data.id}")
				return customerInstance
			}
		} else {// create mode
				if(log.isDebugEnabled())
					log.debug("Create new Customer")

				customerInstance = new Customer()
				customerInstance.properties["mobile", "firstName", "lastName", "email", "isActive", "subscribeNewsLetter", "restaurant", "version"] = data
				customerInstance.createdBy = springSecurityService.principal.username
				customerInstance.code = generateCustomerCode()
		}
		if(restaurant)
			customerInstance.restaurant = restaurant
			
		if(!customerInstance.mobile) {
			customerInstance.errors.rejectValue("mobile", "error.mobile.null")
			customerInstance.code = null
		}
		if(!customerInstance.hasErrors()) {
			customerInstance.save()
		}
		return customerInstance
    }
	
	def generateCustomerCode() {
		def notGenerated = true
		def refNum
		while(notGenerated) {
			refNum = new IDUtils().generateID()
			if(Customer.executeQuery("SELECT 1 from Customer c WHERE c.code = ?", [refNum]).empty)
				notGenerated = false
			else
				log.warn("Collision detected while generating customer code!!! Retrying...")
		}
		return notGenerated? null: refNum
	}
}
