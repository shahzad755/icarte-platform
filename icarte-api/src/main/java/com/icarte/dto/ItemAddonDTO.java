package com.icarte.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class ItemAddonDTO implements Serializable {

	private Long addonId;
	private BigDecimal price;
	private String imageUrl;
	private Long itemAddonId;
	private Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();
	public Long getAddonId() {
		return addonId;
	}
	public void setAddonId(Long addonId) {
		this.addonId = addonId;
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
	public Long getItemAddonId() {
		return itemAddonId;
	}
	public void setItemAddonId(Long itemAddonId) {
		this.itemAddonId = itemAddonId;
	}
	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}
	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}

	


}
