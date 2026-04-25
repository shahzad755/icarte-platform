package com.icarte.module.ordermgmt.service;

import com.icarte.dto.OrderConfirmationDTO;
import com.icarte.dto.OrderDTO;
import com.icarte.dto.ResponseDTO;

public interface OrderManagementService {

	OrderDTO getOrderData(Long orderId);
	
	ResponseDTO<OrderConfirmationDTO> createOrder(OrderDTO orderDTO);
}
