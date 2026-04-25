package com.icarte.module.devicemgmt.service;

import com.icarte.domain.RestaurantDevice;
import com.icarte.dto.RequestDTO;

public interface DeviceManagementService {

	RestaurantDevice registerDevice(RestaurantDevice resturantDevice);
	
	RestaurantDevice finalizeRegistration(RequestDTO requestDTO);
	
	String generateRegistrationCode(RestaurantDevice device);
	
	Boolean validateDeviceSubscription(Long deviceId , String activationCode , Long restaurantId);
	
}
