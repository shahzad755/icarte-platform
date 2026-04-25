package com.icarte.module.menu.service;

import java.util.List;

import com.icarte.commons.Constants.JsonObjectType;
import com.icarte.domain.ObjectJson;
import com.icarte.domain.Resturant;

public interface JsonManagementService {

	/**
	 * Convert Categories to JSON and save
	 * @param menuId
	 * @param version
	 */
	String jsonifyData(Resturant restaurant, List data, Long parentId , Long langId , JsonObjectType objectType);
	
	/**
	 * Return JSON for Given parent id and language
	 * @param parentId
	 * @param objectType
	 * @param languageId
	 * @return
	 */
	ObjectJson findJSON(Long parentId , JsonObjectType objectType , Long languageId , Long version);

	
	/**
	 * Return JSON for Given parent id and language
	 * @param parentId
	 * @param objectType
	 * @param languageId
	 * @return
	 */
	ObjectJson findJSON(Long parentId , JsonObjectType objectType);

	
}
