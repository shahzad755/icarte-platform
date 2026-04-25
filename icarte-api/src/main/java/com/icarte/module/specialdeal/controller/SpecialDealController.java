package com.icarte.module.specialdeal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icarte.commons.marshler.JsonMarshaller;
import com.icarte.dto.ItemResponseDTO;
import com.icarte.dto.RequestDTO;
import com.icarte.dto.ResponseDTO;
import com.icarte.dto.SpecialDealDTO;
import com.icarte.dto.SpecialDealResponseDTO;
import com.icarte.module.devicemgmt.service.DeviceManagementService;
import com.icarte.module.item.service.ItemManagementService;
import com.icarte.module.specialdeal.service.SpecialDealMgmtService;


@Controller
public class SpecialDealController {
	
	@Autowired
	private SpecialDealMgmtService specialDealMgmtService;
	
	@Autowired
	private DeviceManagementService deviceMgmtService;
	
	@Autowired
	private JsonMarshaller jsonMarshaller;
	@RequestMapping(value = "/secure/specialDeals", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO<SpecialDealResponseDTO> listSpecialDeals(@RequestBody RequestDTO requestDTO , HttpServletRequest request) {
		
		ResponseDTO<SpecialDealResponseDTO> resp = new ResponseDTO<SpecialDealResponseDTO>();

		if(deviceMgmtService.validateDeviceSubscription(requestDTO.getDeviceId(), requestDTO.getActivationCode(), requestDTO.getRestaurantId())){
			
			 List<SpecialDealDTO> specialDeals = specialDealMgmtService.findSpecialDeals(requestDTO.getRestaurantId());
			
			 SpecialDealResponseDTO specialDealResponse = new SpecialDealResponseDTO();
			 specialDealResponse.setSpecialDeals(specialDeals);
			resp.setModel(specialDealResponse);
			resp.setResponseCode("200");
		}else{
			resp.setResponseCode("909");
			resp.setErrorDetails("Device not Registered");
			
		}
		resp.setRequestType("specialDeals");
		
		return resp ;
	}
	
}
