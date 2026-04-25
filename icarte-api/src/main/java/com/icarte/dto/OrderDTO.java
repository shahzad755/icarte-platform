package com.icarte.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDTO implements Serializable{

	private Long orderId;
	private StaffDTO staff;
	private BranchDTO branch;
	private ServingTableDTO servingTableDTO;
	private String referenceNum;
	private Date orderDate;
	private String specialRemarks;
	private long orderStatus;
	private String cancellationReason;
	
	private List<OrderItemDTO> orderItems = new ArrayList<OrderItemDTO>();
	private List<SpecialDealDTO> specialDeals = new ArrayList<SpecialDealDTO>();
	
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public StaffDTO getStaff() {
		return staff;
	}

	public void setStaff(StaffDTO staff) {
		this.staff = staff;
	}

	public BranchDTO getBranch() {
		return branch;
	}

	public void setBranch(BranchDTO branch) {
		this.branch = branch;
	}

	public ServingTableDTO getServingTableDTO() {
		return servingTableDTO;
	}

	public void setServingTableDTO(ServingTableDTO servingTableDTO) {
		this.servingTableDTO = servingTableDTO;
	}

	public String getReferenceNum() {
		return referenceNum;
	}

	public void setReferenceNum(String referenceNum) {
		this.referenceNum = referenceNum;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getSpecialRemarks() {
		return specialRemarks;
	}

	public void setSpecialRemarks(String specialRemarks) {
		this.specialRemarks = specialRemarks;
	}

	public long getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(long orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getCancellationReason() {
		return cancellationReason;
	}

	public void setCancellationReason(String cancellationReason) {
		this.cancellationReason = cancellationReason;
	}

	public List<OrderItemDTO> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItemDTO> orderItems) {
		this.orderItems = orderItems;
	}	
	

	public List<SpecialDealDTO> getSpecialDeals() {
		return specialDeals;
	}
	
	public void setSpecialDeals(List<SpecialDealDTO> specialDeals) {
		this.specialDeals = specialDeals;
	}
	
}
