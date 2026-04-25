package com.icarte.dto;

import java.io.Serializable;

public class SpecialDealItemDTO implements Serializable {

	private Long specialDealItemId;
	private ItemDTO itemDTO;
	private int quantity;
	public Long getSpecialDealItemId() {
		return specialDealItemId;
	}
	public void setSpecialDealItemId(Long specialDealItemId) {
		this.specialDealItemId = specialDealItemId;
	}
	public ItemDTO getItemDTO() {
		return itemDTO;
	}
	public void setItemDTO(ItemDTO itemDTO) {
		this.itemDTO = itemDTO;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	
}
