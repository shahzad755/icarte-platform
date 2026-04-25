package com.armedialab.entity



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import com.armedialab.reference.RestaurantManagementService

@Transactional(readOnly = true)
class RestaurantDeviceController {
	
    static allowedMethods = [save: "POST", update: "PUT"]
	def springSecurityService
	def RestaurantManagementService restaurantManagementService
	
    def index(Integer max) {
/*        params.max = Math.min(max ?: 10, 100)
        respond RestaurantDevice.list(params), model:[restaurantDeviceInstanceCount: RestaurantDevice.count()]
*/    
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = RestaurantDevice.list()
		}else if(request.isUserInRole("ROLE_RESTAURANT_OWNER")) {
			results =  RestaurantDevice.findAll("from RestaurantDevice where restaurant = ?",
				[Staff.findByUser(user)?.restaurant])
		} else if(request.isUserInRole("ROLE_MANAGER")){
			results = RestaurantDevice.findAll("from RestaurantDevice as st where st.branch = ?",
			[Staff.findByUser(user)?.branch]/*, max: maxRows, offset: rowOffset, sort: sortColumn, order: sortOrder*/)
		}
		render (view: 'index', model: [restaurantDeviceInstanceList: results])
	}

    def show(RestaurantDevice restaurantDeviceInstance) {
        respond restaurantDeviceInstance
    }

    def create() {
		render (view: 'create', model: [restaurantDeviceInstance: new RestaurantDevice(params), 
				branchList: loadBranchList(), 
				appModeList: loadAppModes()])
    }

    @Transactional
    def save(RestaurantDevice restaurantDeviceInstance) {
        if (restaurantDeviceInstance == null) {
            notFound()
            return
        }

        restaurantDeviceInstance = restaurantManagementService.saveRestaurantDevice(restaurantDeviceInstance)
		
		restaurantDeviceInstance.errors.allErrors.collect {
			log.debug("Validation Error:[${it}]")
        }
		
        if (restaurantDeviceInstance.hasErrors()) {
            respond restaurantDeviceInstance.errors,
			 [view:'create', model:['branchList': loadBranchList(),
				 appModeList: loadAppModes()]]
            return
        }
	
/*		flash.message = message(code: 'restaurantDevice.created.message', args: [message(code: 'restaurantDevice.label', default: 'Restaurant Device'), restaurantDeviceInstance.deviceId])
		redirect(action: 'edit', params: [id: restaurantDeviceInstance.id])*/
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'restaurantDevice.created.message', args: [message(code: 'restaurantDevice.label', default: 'Restaurant Device'), restaurantDeviceInstance.deviceId])
                redirect restaurantDeviceInstance
            }
            '*' { respond restaurantDeviceInstance, [status: CREATED] }
        }
    }

    def edit(RestaurantDevice restaurantDeviceInstance) {
		render (view: 'edit', model: [restaurantDeviceInstance: restaurantDeviceInstance, 
			branchList: loadBranchList(), 
				appModeList: loadAppModes()])
    }

    @Transactional
    def update(RestaurantDevice restaurantDeviceInstance) {
		if (restaurantDeviceInstance == null) {
			notFound()
			return
		}
		restaurantDeviceInstance = restaurantManagementService.saveRestaurantDevice(restaurantDeviceInstance)
		
		if (restaurantDeviceInstance.hasErrors()) {
			respond restaurantDeviceInstance.errors,
			 [view:'edit', model:['branchList': loadBranchList(),
				 appModeList: loadAppModes()]]
			return
		}
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'restaurantDevice.updated.message', args: [message(code: 'restaurantDevice.label', default: 'Restaurant Device'), restaurantDeviceInstance.deviceId])
				redirect restaurantDeviceInstance
			}
			'*' { respond restaurantDeviceInstance, [status: OK] }
		}
    }

	def loadAppModes() {
		return [1: 'Roaming', 2: 'Fixed on Table', 3: 'Kiosk'].entrySet()
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

	def loadServingTableList() {
		def user = springSecurityService.loadCurrentUser()
		def results = []
		if(params.branchId ) {
			results = ServingTable.executeQuery("Select s.id, s.tableRefNumber from ServingTable s where s.branch.id=? and s.isActive = ? order by s.tableRefNumber asc", [(params.branchId as Long), true])
		}
		render results as JSON
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurantDevice.label', default: 'RestaurantDevice'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
