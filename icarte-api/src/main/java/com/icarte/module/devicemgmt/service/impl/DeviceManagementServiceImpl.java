package com.icarte.module.devicemgmt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.Utilities;
import com.icarte.domain.RestaurantDevice;
import com.icarte.domain.Resturant;
import com.icarte.dto.RequestDTO;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.devicemgmt.dao.DeviceManagementDAO;
import com.icarte.module.devicemgmt.service.DeviceManagementService;

@Service
public class DeviceManagementServiceImpl implements DeviceManagementService {

	@Autowired
	private DeviceManagementDAO deviceDAO;
	
	@Transactional
	public RestaurantDevice finalizeRegistration(RequestDTO requestDTO) {		
		RestaurantDevice newDevice = null;
		try{
			newDevice = deviceDAO.findById(RestaurantDevice.class, requestDTO.getDeviceId());
			if(	newDevice.getResturant().getResturantId().equals(requestDTO.getRestaurantId()) &&
					newDevice.getRegistrationCode().equals(requestDTO.getActivationCode())){
				newDevice.setIsActive(1);
				deviceDAO.persist(newDevice);
			}else{
				throw new RecordNotFoundException("Device Not Found");
			}
		}catch(RecordNotFoundException rnfEx){
			throw new RecordNotFoundException(rnfEx);
		}
		return newDevice;
	}
	
	@Transactional
	public String generateRegistrationCode(RestaurantDevice device) {
		String registrationCode = Utilities.generateRandomString();
		device.setRegistrationCode(registrationCode);
		deviceDAO.persist(device);
		return registrationCode;
	}
	
	@Transactional
	public RestaurantDevice registerDevice(RestaurantDevice resturantDevice) {
		deviceDAO.persist(resturantDevice);
		
		generateRegistrationCode(resturantDevice); 
		
		return resturantDevice;
	}
	
	private boolean isDeviceActive(Integer flag){
		return flag == null ? false : flag.equals(1);
	}
	
	@Transactional
	public Boolean validateDeviceSubscription(Long deviceId , String activationCode , Long restaurantId) {
		try{
			RestaurantDevice restaurantDevice = deviceDAO.findById(RestaurantDevice.class, deviceId);
			
			if(null != restaurantDevice){
				if(restaurantDevice.getResturant().getResturantId().equals(restaurantId) &&
						restaurantDevice.getRegistrationCode().equals(activationCode) && isDeviceActive(restaurantDevice.getIsActive())){
					return true;
				}
			}
		}catch(RecordNotFoundException rnfEx){
			return false;
		}
		return false;
	}
}
