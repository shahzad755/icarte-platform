package com.icarte.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.icarte.domain.Resturant;

public class CuisineTypeDTO implements Serializable{

	private Long cuisineTypeId;
//	private Resturant resturant;
	private String imageUrl;

//	private Integer isActive;
//	private String title;
	private Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();
	public Long getCuisineTypeId() {
		return cuisineTypeId;
	}
	public void setCuisineTypeId(Long cuisineTypeId) {
		this.cuisineTypeId = cuisineTypeId;
	}
//	public Resturant getResturant() {
//		return resturant;
//	}
//	public void setResturant(Resturant resturant) {
//		this.resturant = resturant;
//	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
//	public Integer getIsActive() {
//		return isActive;
//	}
//	public void setIsActive(Integer isActive) {
//		this.isActive = isActive;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}
	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}
	
	
	
	
	
}
