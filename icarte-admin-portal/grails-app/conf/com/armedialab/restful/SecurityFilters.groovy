package com.armedialab.restful

import grails.converters.JSON

import org.springframework.http.HttpStatus

import com.armedialab.entity.Restaurant
import com.armedialab.entity.RestaurantDevice;
import com.armedialab.util.Constants

class SecurityFilters {

    def filters = {
        all(controller:'front', action:'*') {
            before = {
				//Thread.sleep(2000)
				def isSuccess = false
					def req = request.JSON
					if(log.isDebugEnabled())
						log.debug("************* Before filter ****************\n\rRequest.JSON: ${ req as JSON}")
					
					if(req){
						def auth = req.authorization
						if(auth.restaurantCode && 
							req.applicationVersion && 
							auth.deviceSerialNo && 
							auth.deviceRegistrationCode &&
							auth.restaurantActivationKey) {
								def restaurant = Restaurant.findByRestaurantCodeAndActivationKey(auth.restaurantCode, 
									auth.restaurantActivationKey)
								if(restaurant){
									def device = RestaurantDevice.find {
										(deviceId == auth.deviceSerialNo
										&& restaurant == restaurant
										&& registrationCode == auth.deviceRegistrationCode)
									}
									if(device) {
										request[Constants.KEY_RESTAURANT] = restaurant
										request[Constants.KEY_DEVICE_INFO] = device
										//request[Constants.KEY_BRANCH] = device.branch
										isSuccess = true
									}
								}
						} else {
							log.debug "Missing required parameters..."
						}
				}
					if(!isSuccess){
						log.debug "Restaurant registration Not found..."
						def res = [responseCode: HttpStatus.OK.value, isSuccess: false,
								errorDetails: "No registration records found. Please register your device for your restaurant..."]
						render(text: res as JSON, contentType: "application/json", encoding: "UTF-8")
						
//						render 
					}
				return isSuccess
            }
            after = { Map model ->
				if(log.isDebugEnabled()) {
					log.debug("************* After filter ****************")
				}
            }
            afterView = { Exception e ->

            }
        }
    }
}
