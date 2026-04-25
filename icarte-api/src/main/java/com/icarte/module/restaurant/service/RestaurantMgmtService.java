package com.icarte.module.restaurant.service;

import com.icarte.domain.Resturant;

public interface RestaurantMgmtService {

	/**
	 * 
	 * @param restaurantId
	 * @return
	 */
	Resturant findById(Long restaurantId);
}
