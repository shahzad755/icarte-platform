package com.icarte.dto;

import java.io.Serializable;

public class TranslationDTO implements Serializable {
	private Long translationId;
	private String title;
	private String description;
	private Long languageId;
	public Long getTranslationId() {
		return translationId;
	}
	public void setTranslationId(Long translationId) {
		this.translationId = translationId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getLanguageId() {
		return languageId;
	}
	public void setLanguageId(Long languageId) {
		this.languageId = languageId;
	}
	
	
}
