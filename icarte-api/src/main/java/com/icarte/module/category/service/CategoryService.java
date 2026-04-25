package com.icarte.module.category.service;

import java.util.List;

import com.icarte.domain.ItemCategory;
import com.icarte.domain.ObjectJson;
import com.icarte.dto.ItemCategoryDTO;

public interface CategoryService {

	/**
	 * Load Categories by given resturant Id
	 * @param resturantId
	 * @return
	 */
	List<ItemCategory> loadCategries(Long resturantId);
	
	/**
	 * 
	 * @param menuId
	 * @return
	 */
	List<ItemCategory> loadCategoriedByMenu(Long menuId);
	
	/**
	 * 
	 * @param menuId
	 * @param version
	 * @param langId
	 */
	void jsonifyCategories(Long menuId , Long version , Long langId);
	
	/**
	 * Find JSON Representation of Categories
	 * @param menuId
	 * @param version
	 * @param langId
	 * @return
	 */
	ObjectJson findCategoriesJson(Long menuId, Long version , Long langId);
	
	List<ItemCategoryDTO> findCategories(Long menuId);
}
