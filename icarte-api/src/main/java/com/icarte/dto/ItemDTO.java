package com.icarte.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ItemDTO implements Serializable{
	private Long itemId;
	private BigDecimal price;
	private String tags;
	private Long categoryId;
	private SpiceTypeDTO spiceType;
	private CuisineTypeDTO cusineType;
	private List<MediaContentDTO> mediaContents = new ArrayList<MediaContentDTO>();
	private List<ItemIngredientDTO> itemIngrediants = new ArrayList<ItemIngredientDTO>();
	private List<ItemVariantDTO> itemVariants = new ArrayList<ItemVariantDTO>();
	
	private Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();
	
	private List<ItemAddonDTO> addons = new ArrayList<ItemAddonDTO>();
	
	
	public List<ItemVariantDTO> getItemVariants() {
		return itemVariants;
	}
	
	public void setItemVariants(List<ItemVariantDTO> itemVariants) {
		this.itemVariants = itemVariants;
	}
	
	public SpiceTypeDTO getSpiceType() {
		return spiceType;
	}

	public void setSpiceType(SpiceTypeDTO spiceType) {
		this.spiceType = spiceType;
	}

	public CuisineTypeDTO getCusineType() {
		return cusineType;
	}

	public void setCusineType(CuisineTypeDTO cusineType) {
		this.cusineType = cusineType;
	}

	public List<MediaContentDTO> getMediaContents() {
		return mediaContents;
	}

	public void setMediaContents(List<MediaContentDTO> mediaContents) {
		this.mediaContents = mediaContents;
	}

	public List<ItemIngredientDTO> getItemIngrediants() {
		return itemIngrediants;
	}

	public void setItemIngrediants(List<ItemIngredientDTO> itemIngrediants) {
		this.itemIngrediants = itemIngrediants;
	}

	public Long getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}

	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}

	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}

	public List<ItemAddonDTO> getAddons() {
		return addons;
	}
	
	public void setAddons(List<ItemAddonDTO> addons) {
		this.addons = addons;
	}
	
	
}
