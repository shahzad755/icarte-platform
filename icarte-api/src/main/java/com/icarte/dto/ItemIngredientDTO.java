package com.icarte.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class ItemIngredientDTO implements Serializable{
	private Long ingredientId;
	private String imageUrl;
//	private Integer isActive;
	private Long itemIngredientId;
	private Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();
	public Long getIngredientId() {
		return ingredientId;
	}
	public void setIngredientId(Long ingredientId) {
		this.ingredientId = ingredientId;
	}
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
	public Long getItemIngredientId() {
		return itemIngredientId;
	}
	public void setItemIngredientId(Long itemIngredientId) {
		this.itemIngredientId = itemIngredientId;
	}
	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}
	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	} 

	
	

}
