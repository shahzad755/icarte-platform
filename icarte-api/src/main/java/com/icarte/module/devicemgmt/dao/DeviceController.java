package com.icarte.module.devicemgmt.dao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icarte.commons.marshler.JsonMarshaller;
import com.icarte.dto.LoginResponseDTO;
import com.icarte.dto.RequestDTO;
import com.icarte.dto.ResponseDTO;
import com.icarte.module.devicemgmt.service.DeviceManagementService;
import com.icarte.module.login.service.DeviceLoginService;

@Controller
public class DeviceController {

	

	@Autowired
	private DeviceLoginService loginServie;
	
	@Autowired
	private DeviceManagementService deviceMgmtService;
	
	
	
	@Autowired
	private JsonMarshaller jsonMarshaller;
	@RequestMapping(value = "/secure/activateDevice", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO<LoginResponseDTO> loginDevice(@RequestBody RequestDTO requestDTO , HttpServletRequest request) {
		RequestDTO reqBody = new RequestDTO();
		reqBody.setRestaurantId(1L);
		deviceMgmtService.finalizeRegistration(requestDTO);
		ResponseDTO<LoginResponseDTO> resp = loginServie.loginDevice(reqBody); 
		resp.setResponseCode("200");
		resp.setRequestType("activateDevice");
		
		return resp ;
	}
	
}
