package com.armedialab.entity



import static org.springframework.http.HttpStatus.*

import org.springframework.validation.FieldError;

import grails.converters.JSON
import grails.transaction.Transactional
import grails.validation.ValidationException;

import com.armedialab.OrdersManagementService
import com.armedialab.util.Constants;
import static com.armedialab.util.Constants.StatusTypeEnum.*;

@Transactional(readOnly = true)
class OrdersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def propertiesToRender = ['referenceNum', 'totalPrice', 'branch', 'mobile', 'tableRefNumber', 'specialRemarks', 'orderDate', 'staffCode', 'statusType']
	def propertiesToRenderForOrderDetails = ['referenceNum', 'item.code', 'item.mappingCode']
	def springSecurityService
	def grailsApplication
	def OrdersManagementService ordersManagementService

    def index() {
		render (view: 'index', model: [branches: loadBranchList(), orderStatusList: loadOrderStatusList(true), 
				orderStatusFilterList: loadOrderStatusList(false)])
    }

    def list() {
    	if(log.isDebugEnabled())
    		log.debug("OrdersController Grid requested with params${params}")
    		
    		def sortParam = params['order[0][column]']?.toInteger()
			
			def sortColumn = sortParam!=null? propertiesToRender[sortParam]: propertiesToRender[6]
			def sortOrder  = params['order[0][dir]'] ?: 'desc'
						
			def maxRows = params.int('length')?:10;
			def rowOffset = params.int('start')?:0;
			
			def results = ordersManagementService.searchOrders (
					[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
					
			def jsonData = [draw: params.draw,
			                total: results.numberOfPages,
			                recordsTotal: results.totalRows,
			                recordsFiltered: results.totalRows,
			                data: results.records]
			                		render jsonData as JSON
    						                		
    }
    
	def details() {
		render (view: 'orderDetails', model: [orderId: params.orderId, orderRefNum: params.orderRefNum])
	}

	def orderItems() {
		if(log.isDebugEnabled())
			log.debug("OrdersController Detail Grid requested with params${params}")
	
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = sortParam!=null? propertiesToRenderForOrderDetails[sortParam]: propertiesToRenderForOrderDetails[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		def results = ordersManagementService.listOrdersDetails (
			[rowOffset:rowOffset, maxRows: maxRows, sortColumn: sortColumn, sortOrder: sortOrder, data: params])
		
		def jsonData = [draw: params.draw,
						total: results.numberOfPages,
						recordsTotal: results.totalRows,
						recordsFiltered: results.totalRows,
						data: results.records]
		render jsonData as JSON

	}
	
	def orderAddons() {
		if(log.isDebugEnabled())
			log.debug("OrdersController Addon Detail Grid requested with > params${params}")
	
		def sortParam = params['order[0][column]']?.toInteger()
			
		def sortColumn = 'orderAddon.id'//sortParam!=null? propertiesToRenderForOrderDetails[sortParam]: propertiesToRenderForOrderDetails[0]
		def sortOrder  = params['order[0][dir]'] ?: 'asc'
		
		def maxRows = params.int('length')?:10;
		def rowOffset = params.int('start')?:0;
		
		def results = ordersManagementService.listOrderAddonDetails(
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
		def results = []
		if(request.isUserInRole("ROLE_SUPERADMIN")) {
			results = Branch.findAll("from Branch b where b.isActive = ? order by name asc", [true])
		} else if(request.isUserInRole("ROLE_RESTAURANT_OWNER")){
			results = Branch.findAll("from Branch b where b.restaurant=? and b.isActive = ? order by name asc",
					[Staff.findByUser(user)?.restaurant, true])
		} else {
			results = Branch.findAll("from Branch b where b=?",
					[Staff.findByUser(user)?.branch])
		} 
		return results
	}
	
	def loadItemList() {
		if(log.isDebugEnabled())
			log.debug("Loading item list for query params: ${params}")
		
		def results = ordersManagementService.loadItemList(params, request.isUserInRole("ROLE_SUPERADMIN"))
		
		def jsonData = [
			total_count: results.size,
			incomplete_results: false,
			items: results]

		render jsonData as JSON
	}
	
	def loadAddonList() {
		if(log.isDebugEnabled())
			log.debug("Loading addon list for query params: ${params}")
		
		def results = ordersManagementService.loadAddonList(params, request.isUserInRole("ROLE_SUPERADMIN"))
		
		def jsonData = [
			total_count: results.size,
			incomplete_results: false,
			items: results]

		render jsonData as JSON
	}
	
	def loadOrderStatusList(boolean excludeNewStatus) {
		def idList = null
		if(excludeNewStatus)
			idList = [ACTIONED.getStatusTypeId(), REQUESTED.getStatusTypeId(), NEW.getStatusTypeId()]
		else
			idList = [ACTIONED.getStatusTypeId(), REQUESTED.getStatusTypeId()]
		return StatusType.findAll("from StatusType as st WHERE st.isActive=true AND st.isOrderStatus=true AND st.id not in (:idList) ORDER BY st.name ASC",
			[idList: idList])
	}
	
	@Transactional
	def updateStatus() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		if(params.orderId && params.modalStatus) {
			try {
				def order = ordersManagementService.updateOrderStatus(params.long('orderId'), 
						params.long('modalStatus'), params.statusChangeReason?.trim())
				state = "OK"
				msg = "Order ${order.referenceNum} status updated successfully!"
				
			} catch(ValidationException ex) {
				response.status = response.SC_INTERNAL_SERVER_ERROR
				errs = transformError(ex)
			}
			def jsonData = [message: msg, errors: errs, state: state]
			render jsonData as JSON
	
		} else {
			render noRecord(params.id, "Order", messageSource, response.SC_NOT_FOUND) as JSON
		}
	}

	@Transactional
	def addOrderItem() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		try {
			def orderItemInstance = ordersManagementService.addItemToOrder(
				params.long('order_id'), params.long('itemVariantId'), params.int('quantity'), params.remarks)
			
			state = "OK"
			msg = "Item '${orderItemInstance?.itemVariant.getDefaultTitle()}' added to order successfully!"
		} catch(ValidationException ex) {
			response.status = response.SC_INTERNAL_SERVER_ERROR
			state = "FAIL"
			errs = transformError(ex)
		}

		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}

	@Transactional
	def updateOrderItem() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		try {
			def orderItemInstance = ordersManagementService.updateItemInOrder(
				params.long('orderItemVariantId'), params.int('quantity'), params.remarks)
			
			state = "OK"
			msg = "Order Item '${orderItemInstance?.itemVariant.getDefaultTitle()}' updated successfully!"
		} catch(ValidationException ex) {
			response.status = response.SC_INTERNAL_SERVER_ERROR
			state = "FAIL"
			errs = transformError(ex)
		}

		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}


	@Transactional
	def deleteOrderItem() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		try {
			ordersManagementService.deleteItemFromOrder(params.long('orderItemVariantId'))
			state = "OK"
			msg = "Order Item removed from order successfully!"
		} catch(ValidationException ex) {
			response.status = response.SC_INTERNAL_SERVER_ERROR
			state = "FAIL"
			errs = transformError(ex)
		}

		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}

	@Transactional
	def addOrderAddon() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		try {
			def orderItemsAddonInstance = ordersManagementService.addAddonToOrderItem(
				params.long('addonId'), params.long('orderItemVarId'), params.int('addonQuantity'), params.addonRemarks)
			
			state = "OK"
			msg = "Addon '${orderItemsAddonInstance.itemAddon.addon.getDefaultTitle()}' added to order successfully!"
		} catch(ValidationException ex) {
			response.status = response.SC_INTERNAL_SERVER_ERROR
			state = "FAIL"
			errs = transformError(ex)
		}

		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}

	@Transactional
	def updateOrderItemAddon() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		try {
			def orderItemsAddonInstance = ordersManagementService.updateAddonInOrderItem(
				params.long('orderItemAddonId'), params.int('addonQuantity'), params.addonRemarks)
			
			state = "OK"
			msg = "Addon '${orderItemsAddonInstance.itemAddon.addon.getDefaultTitle()}' updated successfully!"
		} catch(ValidationException ex) {
			response.status = response.SC_INTERNAL_SERVER_ERROR
			state = "FAIL"
			errs = transformError(ex)
		}


		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}

	@Transactional
	def deleteOrderItemAddon() {
		def msg = ""
		def errs = [:]
		def state = "FAIL"
		try {
			ordersManagementService.deleteAddonFromOrder(params.long('orderItemAddonId'))
			state = "OK"
			msg = "Addon removed from order successfully!"
		} catch(ValidationException ex) {
			response.status = response.SC_INTERNAL_SERVER_ERROR
			state = "FAIL"
			errs = transformError(ex)
		}

		def jsonData = [message: msg, errors: errs, state: state]
		render jsonData as JSON
	}
	
	def List transformError(ValidationException ex) {
		def errs
		if(ex.errors) {
			errs = ex.errors.allErrors.collect {
				if(log.isDebugEnabled())
					log.debug("Error:[${it}]")

				if(it instanceof FieldError)
					[field: it.field, error: message(error:it, encodeAs:'HTML')]
				else
					["error": message(error:it, encodeAs:'HTML')]
			}
		} else {
			errs = [["error": ex.message]]
		}
		return errs
	}

	private Map noRecord(name, id) {
		log.debug "Record with name ${name}, id: ${id} not found"
		
		def error
		if(id)
			error = [["error":	 message(code: 'default.not.found.message', args: [
						message(code: 'order.label', default: name),id])
						]]
		else
			error =  [["error":	 "Request parameter 'id' is null"]]
		return [errors: error, state: response.SC_NOT_FOUND]
	}

}
