package com.icarte.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ItemCategoryDTO implements Serializable {
	private Long itemCategoryId;
	private String imageUrl;
	private String smallIconUrl;
	private String largeIconUrl;
	private long parentCategory;
	private String tags;
	private Date availableDurationStart;
	private Date availableDurationEnd;
	private long resturantId;
	private Integer isActive;
	private Integer priority;
	
	Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();
	

	public Integer getPriority() {
		return priority;
	}
	
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	
	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}
	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}
	public Long getItemCategoryId() {
		return itemCategoryId;
	}
	public void setItemCategoryId(Long itemCategoryId) {
		this.itemCategoryId = itemCategoryId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getSmallIconUrl() {
		return smallIconUrl;
	}
	public void setSmallIconUrl(String smallIconUrl) {
		this.smallIconUrl = smallIconUrl;
	}
	public String getLargeIconUrl() {
		return largeIconUrl;
	}
	public void setLargeIconUrl(String largeIconUrl) {
		this.largeIconUrl = largeIconUrl;
	}
	public long getParentCategory() {
		return parentCategory;
	}
	public void setParentCategory(long parentCategory) {
		this.parentCategory = parentCategory;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public Date getAvailableDurationStart() {
		return availableDurationStart;
	}
	public void setAvailableDurationStart(Date availableDurationStart) {
		this.availableDurationStart = availableDurationStart;
	}
	public Date getAvailableDurationEnd() {
		return availableDurationEnd;
	}
	public void setAvailableDurationEnd(Date availableDurationEnd) {
		this.availableDurationEnd = availableDurationEnd;
	}
	public long getResturantId() {
		return resturantId;
	}
	public void setResturantId(long resturantId) {
		this.resturantId = resturantId;
	}
	public Integer getIsActive() {
		return isActive;
	}
	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

}
