package com.icarte.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SpecialDealDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long specialDealId;
	private Date startDate;
	private Date endDate;
	private BigDecimal price;
	private String imageUrl;
	private Integer isActive;

	private List<SpecialDealItemDTO> specialDealItems = new ArrayList<SpecialDealItemDTO>();
	
	private Map<String ,TranslationDTO > translations = new HashMap<String, TranslationDTO>();
	
	
	
	
	
	
	public List<SpecialDealItemDTO> getSpecialDealItems() {
		return specialDealItems;
	}

	public void setSpecialDealItems(List<SpecialDealItemDTO> specialDealItems) {
		this.specialDealItems = specialDealItems;
	}

	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}

	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}

	public Long getSpecialDealId() {
		return specialDealId;
	}

	public void setSpecialDealId(Long specialDealId) {
		this.specialDealId = specialDealId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	
	
	
}
