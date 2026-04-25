package com.icarte.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class OrderItemDTO implements Serializable{

	private Long itemId;
	private long quantity;
	private String specialRemarks;
	private BigDecimal orderPrice;
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
	public String getSpecialRemarks() {
		return specialRemarks;
	}
	public void setSpecialRemarks(String specialRemarks) {
		this.specialRemarks = specialRemarks;
	}
	public BigDecimal getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}

	

}
