package com.icarte.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class ItemVariantDTO implements Serializable{
	private Long itemVariantId;
	private long variantId;
	private BigDecimal price;
	private int approxPreperationTime;
	
	private Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();
	
	
	public Long getItemVariantId() {
		return itemVariantId;
	}
	public void setItemVariantId(Long itemVariantId) {
		this.itemVariantId = itemVariantId;
	}
	public long getVariantId() {
		return variantId;
	}
	public void setVariantId(long variantId) {
		this.variantId = variantId;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getApproxPreperationTime() {
		return approxPreperationTime;
	}
	public void setApproxPreperationTime(int approxPreperationTime) {
		this.approxPreperationTime = approxPreperationTime;
	}


	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}
	
	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}
	
}
