package com.icarte.module.item.controller;

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
import com.icarte.module.devicemgmt.service.DeviceManagementService;
import com.icarte.module.item.service.ItemManagementService;


@Controller
public class ItemController {
	
	@Autowired
	private ItemManagementService itemMgmtService;
	
	@Autowired
	private DeviceManagementService deviceMgmtService;
	
	@Autowired
	private JsonMarshaller jsonMarshaller;
	@RequestMapping(value = "/secure/listItems", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO<ItemResponseDTO> listItems(@RequestBody RequestDTO requestDTO , HttpServletRequest request) {
		
		ResponseDTO<ItemResponseDTO> resp = new ResponseDTO<ItemResponseDTO>();

		if(deviceMgmtService.validateDeviceSubscription(requestDTO.getDeviceId(), requestDTO.getActivationCode(), requestDTO.getRestaurantId())){
			ItemResponseDTO responseDTO= itemMgmtService.findItemsByItemCategory(requestDTO.getCategoryId());
			resp.setModel(responseDTO);
			resp.setResponseCode("200");
		}else{
;
			resp.setResponseCode("909");
			resp.setErrorDetails("Device not Registered");
			
		}
		resp.setRequestType("listItems");
		
		return resp ;
	}
	
}
