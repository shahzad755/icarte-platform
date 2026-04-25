package com.icarte.dto;

import java.io.Serializable;

public class ServingTableDTO implements Serializable{
	private Long servingTableId;
	private String description;
	private String tableRefNumber;
	public Long getServingTableId() {
		return servingTableId;
	}
	public void setServingTableId(Long servingTableId) {
		this.servingTableId = servingTableId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTableRefNumber() {
		return tableRefNumber;
	}
	public void setTableRefNumber(String tableRefNumber) {
		this.tableRefNumber = tableRefNumber;
	}



}
