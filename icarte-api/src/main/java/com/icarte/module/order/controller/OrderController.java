package com.icarte.module.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icarte.dto.OrderConfirmationDTO;
import com.icarte.dto.OrderDTO;
import com.icarte.dto.RequestDTO;
import com.icarte.dto.ResponseDTO;
import com.icarte.module.ordermgmt.service.OrderManagementService;

@Controller
public class OrderController{

	@Autowired
	private OrderManagementService orderService;

	@RequestMapping(value = "/secure/orders", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO<OrderDTO> listOrderDTO(
			@RequestBody RequestDTO requestDTO, HttpServletRequest request) {
		RequestDTO reqBody = new RequestDTO();
		reqBody.setRestaurantId(1L);
		ResponseDTO<OrderDTO> resp = new ResponseDTO<OrderDTO>();
		OrderDTO order = orderService.getOrderData(1L);
		orderService.createOrder(order);
		resp.setIsSuccess(true);
		resp.setModel(order);
		resp.setRequestType("Order");
		resp.setResponseCode("200");
		return resp;
	}

	
	@RequestMapping(value = "/secure/postorder", method = RequestMethod.POST)
	public @ResponseBody ResponseDTO<OrderConfirmationDTO> postOrder(
			@RequestBody RequestDTO requestDTO, HttpServletRequest request) {
		RequestDTO reqBody = new RequestDTO();
		reqBody.setRestaurantId(1L);
		ResponseDTO<OrderConfirmationDTO> resp = new ResponseDTO<OrderConfirmationDTO>();
		OrderDTO order = orderService.getOrderData(1L);
		resp = orderService.createOrder(order);
		return resp;
	}

	
		
	
	
}
