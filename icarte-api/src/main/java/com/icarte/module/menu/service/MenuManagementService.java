package com.icarte.module.menu.service;

import java.util.List;

import com.icarte.domain.Menu;
import com.icarte.domain.ObjectJson;
import com.icarte.dto.MenuDTO;

public interface MenuManagementService {

	List<Menu> listMenuByResturant(Long resturantId);
	
	Menu saveNewMenu(Menu menu);
	
	Menu findMenuById(Long menuId);
	
	/**
	 * Save Menu as A JSON in database
	 * @param resturantId
	 * @param version
	 */
	void jsonifyMenu(Long resturantId , Long version);
	
	/**
	 * Return Json Data for Menu against given language
	 * @param restaurantId
	 * @param version
	 * @param languageId
	 * @return
	 */
	ObjectJson findMenuAsJson(Long restaurantId , Long version , Long languageId);

	public List<MenuDTO> getMenuData(Long resturantId, Long version) ;
}
