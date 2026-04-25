package com.armedialab.restful.dto

import com.armedialab.entity.Address
import com.armedialab.entity.ItemCategory
import com.armedialab.entity.Restaurant
import com.armedialab.util.Utils;

public class VerifyActivationServerResponse extends ServerResponse {
	Restaurant restaurant
	def restaurantTranslations
	def device
	def accountType
	def events
	def menus
	def categories
	def categoryTranslations
	def feedbackConfigs
	def branches
	
	def baseImageUrl
/*	def baseCatsImageFolder
	def baseItemsImageFolder
	def baseEventsImageFolder
	def baseCuisinesImageFolder
	def baseRestaurantsImageFolder
	def baseRestaurantLogosFolder
	def baseRestaurantBgImagesFolder
*/	
}