package com.icarte.module.restaurant.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icarte.domain.Resturant;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.restaurant.dao.RestaurantDAO;
import com.icarte.module.restaurant.service.RestaurantMgmtService;

@Service
public class RestaurantMgmtServiceImpl implements RestaurantMgmtService{

	@Autowired
	private RestaurantDAO restaurantDAO;
	
	public Resturant findById(Long restaurantId) {
		try{
			return restaurantDAO.findById(Resturant.class, restaurantId);
			
		}catch(RecordNotFoundException rnfEx){
			throw new RecordNotFoundException(rnfEx);
		}
	}
	
	
}
