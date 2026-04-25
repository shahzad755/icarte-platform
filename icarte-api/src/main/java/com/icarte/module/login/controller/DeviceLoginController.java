package com.icarte.module.login.controller;

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
import com.icarte.module.login.service.DeviceLoginService;

@Controller
public class DeviceLoginController {

	@Autowired
	private DeviceLoginService loginServie;
	
	@Autowired
	private JsonMarshaller jsonMarshaller;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO<LoginResponseDTO> loginDevice(@RequestBody RequestDTO requestDTO, HttpServletRequest request) {
		RequestDTO reqBody = new RequestDTO();
		reqBody.setRestaurantId(1L);
		ResponseDTO<LoginResponseDTO> resp = loginServie.loginDevice(reqBody); 
//		String jsonString = jsonMarshaller.marshalObject(resp);
		return resp ;
	}

}
