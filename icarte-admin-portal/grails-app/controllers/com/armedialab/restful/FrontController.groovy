package com.armedialab.restful

import grails.validation.ValidationException
import grails.web.JSONBuilder

import org.springframework.http.HttpStatus

import com.armedialab.entity.ItemCategory
import com.armedialab.restful.dto.ItemsServerResponse
import com.armedialab.restful.dto.VerifyActivationServerResponse
import com.armedialab.restful.marshallers.ItemJSONMarshaller
import com.armedialab.restful.marshallers.VerifyActivationJSONMarshaller
import com.armedialab.util.Constants

class FrontController {

	def grailsApplication
	def carteService
	
    def verifyActivation() {
		if(log.isDebugEnabled())
    		log.debug("Params in verifyActivation: ${params}")
		def resp = null
		def req = request.JSON
		VerifyActivationServerResponse sr = new VerifyActivationServerResponse();
		try {
			sr.setResponseCode("${HttpStatus.OK.value}")
			sr.setRequestType(req.requestType)
			sr.setSuccess(true)
			sr.restaurant = request[Constants.KEY_RESTAURANT]
			sr.device = request[Constants.KEY_DEVICE_INFO]
			sr.restaurantTranslations = sr.restaurant.getActiveTranslations()
			sr.branches = sr.restaurant.getActiveBranches()
			sr.events = sr.restaurant.getActiveEvents()
			sr.accountType = sr.restaurant.accountType
			sr.feedbackConfigs = sr.restaurant.getActiveFeedbackConfigs()
			sr.menus = sr.device.branch?.getActiveMenus()
			
			sr.baseImageUrl = grailsApplication.config.imageRemoteURL

			resp = new VerifyActivationJSONMarshaller(carteService).marshall(sr)
			carteService.recordLogin(sr.device)
			
		} catch(def ex) {
			log.error("Error while processing request for verifyActivation", ex)
			sr.setErrorDetails(ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator..")
			sr.setSuccess(false)
			sr.setResponseCode("${HttpStatus.INTERNAL_SERVER_ERROR.value}")
			resp = new VerifyActivationJSONMarshaller(carteService).marshall(sr)
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}
	
	def registerDevice() {
		// register device assumes that pre-registration has happened, i.e. restaurant device has been profiled in the records already
		verifyActivation()
	}

	def loadItems() {
		if(log.isDebugEnabled())
			log.debug("Params in loadItems: ${params}")
		def resp = null
		def req = request.JSON
		ItemsServerResponse sr =  new ItemsServerResponse()
		try {
			sr.setResponseCode("${HttpStatus.OK.value}")
			sr.setRequestType(req.requestType)
			sr.setSuccess(true)
			sr.restaurant = request[Constants.KEY_RESTAURANT]
			sr.itemCategory = ItemCategory.get(req.request.category as Long)
			sr.items = carteService.loadItems(sr.itemCategory, request[Constants.KEY_RESTAURANT])
			resp = new ItemJSONMarshaller(carteService).marshall(sr)
			
		} catch(def ex) {
			log.error("Error while processing request for loadItems", ex)
			sr.setErrorDetails(ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator..")
			sr.setSuccess(false)
			sr.setResponseCode("${HttpStatus.INTERNAL_SERVER_ERROR.value}")
			resp = new ItemJSONMarshaller(carteService).marshall(sr)
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}
	
	def callWaiter() {
		def resp = null
		def req = request.JSON
		if(log.isDebugEnabled())
			log.debug("Params in callWaiter: ${req}")
		try {
			carteService.callWaiterRequest(
					req.request.servingTableRef, 
					req.request.assignedStaffCode, 
					req.request.customerMobile,
					request[Constants.KEY_DEVICE_INFO])
			
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.OK.value
				requestType = req.requestType
				isSuccess = true
				errorDetails = null
			}
		} catch(def ex) {
			log.error("Error while processing request for callWaiter", ex)
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.INTERNAL_SERVER_ERROR.value
				requestType = req.requestType
				isSuccess = false
				errorDetails = ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator.."
			}
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}

	def submitFeedback() {
		def resp = null
		def req = request.JSON
		if(log.isDebugEnabled())
			log.debug("Params in submitFeedback: ${req}")
		try {
			if(log.isDebugEnabled()){
				log.debug "feedbackFields: ${req.request.feedbackFields}"
			}
			
			carteService.saveCustomerFeedback(req.request, request[Constants.KEY_RESTAURANT], 
				request[Constants.KEY_DEVICE_INFO])
			
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.OK.value
				requestType = req.requestType
				isSuccess = true
			}
			
		} catch(def ex) {
			log.error("Error while processing request for submitFeedback", ex)
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.INTERNAL_SERVER_ERROR.value
				requestType = req.requestType
				isSuccess = false
				errorDetails = ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator.."
			}
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}

	def staffLogin() {
		def resp = null
		def req = request.JSON
		if(log.isDebugEnabled())
			log.debug("Params in stafflogin: ${req}")
		try {
			def user = carteService.autenticateStaffLogin(
					req.request.username,
					req.request.password)
			
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.OK.value
				requestType = req.requestType
				isSuccess = user!=null
				errorDetails = null
				model = {
					userName			= user.username
					if(mobile) 
						mobile			= user.staff?.mobile
					staffCode 			= user.staff?.staffCode
					firstName			= user.firstName
					lastName			= user.lastName
					if(email) 
						email			= user.email
				}
			}
		} catch(def ex) {
			def errorCode
			if(ex instanceof ValidationException) 
				errorCode = HttpStatus.NOT_FOUND.value
			else 
				errorCode = HttpStatus.INTERNAL_SERVER_ERROR.value
				
			resp = new JSONBuilder().build {
				responseCode = errorCode
				requestType = req.requestType
				isSuccess = false
				errorDetails = ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator.."
			}
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}

	def submitComments() {
		def resp = null
		def req = request.JSON
		if(log.isDebugEnabled())
			log.debug("Params in submitComments: ${req}")
		try {
			
			carteService.saveCustomerComment(
				req.request,
				request[Constants.KEY_RESTAURANT],
				request[Constants.KEY_DEVICE_INFO])
			
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.OK.value
				requestType = req.requestType
				isSuccess = true
			}
			
		} catch(def ex) {
			log.error("Error while processing request for submitComments", ex)
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.INTERNAL_SERVER_ERROR.value
				requestType = req.requestType
				isSuccess = false
				errorDetails = ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator.."
			}
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}

	def submitOrder() {
		def resp = null
		def req = request.JSON
		if(log.isDebugEnabled())
			log.debug("Params in submitOrder: ${req}")
		try {
			
			def order = carteService.processOrder(
				req.request,
				request[Constants.KEY_RESTAURANT],
				request[Constants.KEY_DEVICE_INFO])
			
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.OK.value
				requestType = req.requestType
				isSuccess = true
				model = {
					orderId				= order.id
					orderRef 			= order.referenceNum
					orderAmount			= order.totalPrice
					estimatedTime		= "30"//TODO: estimatedTime should be a field (calculated based on max order item time)
				}

			}
			
		} catch(def ex) {
			log.error("Error while processing request for submitOrder", ex)
			resp = new JSONBuilder().build {
				responseCode = HttpStatus.INTERNAL_SERVER_ERROR.value
				requestType = req.requestType
				isSuccess = false
				errorDetails = ex.message!=null? ex.message: "Error occured while processing your request. Please contact your administrator.."
			}
		}
		if(log.isDebugEnabled())
			log.debug("JSON Response for request: ${req.requestType} is: ${resp}")

		render(text: resp, contentType: "application/json", encoding: "UTF-8")
	}
}
