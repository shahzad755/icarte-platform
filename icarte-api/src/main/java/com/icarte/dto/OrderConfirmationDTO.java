package com.icarte.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class OrderConfirmationDTO implements Serializable{

	private Long orderId;
	private String orderRef;
	private BigDecimal orderAmount;
	private Long esstimatedTime;
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getOrderRef() {
		return orderRef;
	}
	public void setOrderRef(String orderRef) {
		this.orderRef = orderRef;
	}
	public BigDecimal getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(BigDecimal orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Long getEsstimatedTime() {
		return esstimatedTime;
	}
	public void setEsstimatedTime(Long esstimatedTime) {
		this.esstimatedTime = esstimatedTime;
	}
	
	
	
}
