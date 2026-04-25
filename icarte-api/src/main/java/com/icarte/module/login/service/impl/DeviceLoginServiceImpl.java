package com.icarte.module.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.ObjectTransformer;
import com.icarte.commons.Constants.JsonObjectType;
import com.icarte.commons.marshler.JsonMarshaller;
import com.icarte.domain.ObjectJson;
import com.icarte.domain.Resturant;
import com.icarte.dto.LoginResponseDTO;
import com.icarte.dto.MenuDTO;
import com.icarte.dto.RequestDTO;
import com.icarte.dto.ResponseDTO;
import com.icarte.dto.RestaurantDTO;
import com.icarte.module.login.service.DeviceLoginService;
import com.icarte.module.menu.service.JsonManagementService;
import com.icarte.module.menu.service.MenuManagementService;
import com.icarte.module.restaurant.service.RestaurantMgmtService;

@Service
public class DeviceLoginServiceImpl implements DeviceLoginService{

	@Autowired
	private MenuManagementService menuService;
	
	@Autowired
	private RestaurantMgmtService restaurantService;

	@Autowired
	private JsonManagementService jsonService;
	
	@Autowired
	private JsonMarshaller jsonMarshaller;
	
	
	
	
	
	@Transactional
	public ResponseDTO<LoginResponseDTO> loginDevice(RequestDTO request) {

		LoginResponseDTO modelDTO = new LoginResponseDTO();
		Resturant restaurant = restaurantService.findById(request.getRestaurantId());
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		if (null != restaurant) {
			restaurantDTO = ObjectTransformer.restaurantToDto(restaurant);
		}
		List<MenuDTO> menus = menuService.getMenuData(request.getRestaurantId(), 1L);

		restaurantDTO.setMenus(menus);
		modelDTO.setRestaurant(restaurantDTO);
		ResponseDTO<LoginResponseDTO> response = new ResponseDTO<LoginResponseDTO>();
		response.setModel(modelDTO);

		return response;
	}
}
