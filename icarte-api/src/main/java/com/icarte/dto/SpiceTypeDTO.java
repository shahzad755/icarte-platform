package com.icarte.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.icarte.domain.Resturant;

public class SpiceTypeDTO implements Serializable {

	private Long spiceTypeId;
	private String imageUrl;

	Map<String,TranslationDTO> translations = new HashMap<String, TranslationDTO>();

	public Long getSpiceTypeId() {
		return spiceTypeId;
	}

	public void setSpiceTypeId(Long spiceTypeId) {
		this.spiceTypeId = spiceTypeId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Map<String, TranslationDTO> getTranslations() {
		return translations;
	}

	public void setTranslations(Map<String, TranslationDTO> translations) {
		this.translations = translations;
	}
	
	
}
