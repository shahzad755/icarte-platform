package com.icarte.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SpecialDealResponseDTO implements Serializable{
		private List<SpecialDealDTO> specialDeals = new ArrayList<SpecialDealDTO>();
		private Long restaurantId;
		public List<SpecialDealDTO> getSpecialDeals() {
			return specialDeals;
		}
		public void setSpecialDeals(List<SpecialDealDTO> specialDeals) {
			this.specialDeals = specialDeals;
		}
		public Long getRestaurantId() {
			return restaurantId;
		}
		public void setRestaurantId(Long restaurantId) {
			this.restaurantId = restaurantId;
		}


}
