package com.icarte.dto;

import java.io.Serializable;
import java.util.List;

import com.icarte.domain.ObjectJson;

public class LoginResponseDTO implements Serializable{

	private RestaurantDTO restaurant;

	public RestaurantDTO getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(RestaurantDTO restaurant) {
		this.restaurant = restaurant;
	}
	
	
	

}
