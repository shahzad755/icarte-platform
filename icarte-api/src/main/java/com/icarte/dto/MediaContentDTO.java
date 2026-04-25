package com.icarte.dto;

import java.io.Serializable;

public class MediaContentDTO implements Serializable{

	private Long itemMediaId;
	private String imageUrl;
	private String vedioUrl;
	private int displayOrder;
//	private Integer isActive;
	public Long getItemMediaId() {
		return itemMediaId;
	}
	public void setItemMediaId(Long itemMediaId) {
		this.itemMediaId = itemMediaId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getVedioUrl() {
		return vedioUrl;
	}
	public void setVedioUrl(String vedioUrl) {
		this.vedioUrl = vedioUrl;
	}
	public int getDisplayOrder() {
		return displayOrder;
	}
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
//	public Integer getIsActive() {
//		return isActive;
//	}
//	public void setIsActive(Integer isActive) {
//		this.isActive = isActive;
//	}
//
//	
	
	
	
	
	
}
