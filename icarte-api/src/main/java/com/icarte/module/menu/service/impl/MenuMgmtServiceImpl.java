package com.icarte.module.menu.service.impl;

import static com.icarte.commons.Constants.NamedQueries.FIND_MENU_BY_REST_ID;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.ObjectTransformer;
import com.icarte.commons.Constants.JsonObjectType;
import com.icarte.domain.Menu;
import com.icarte.domain.ObjectJson;
import com.icarte.domain.Resturant;
import com.icarte.dto.ItemCategoryDTO;
import com.icarte.dto.MenuDTO;
import com.icarte.dto.RestaurantDTO;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.category.service.CategoryService;
import com.icarte.module.menu.dao.MenuDAO;
import com.icarte.module.menu.service.JsonManagementService;
import com.icarte.module.menu.service.MenuManagementService;
import com.icarte.module.restaurant.service.RestaurantMgmtService;

@Service
public class MenuMgmtServiceImpl implements MenuManagementService {
	/**
	 * Logger.
	 */
	private static final Log LOGGER = LogFactory
			.getLog(MenuMgmtServiceImpl.class);

	@Autowired
	private MenuDAO menuDAO;

	@Autowired
	private RestaurantMgmtService restaurantMgmtService;
	
	
	@Autowired
	private JsonManagementService jsonMgmtService;

	@Autowired
	private CategoryService categoryService;
	
	@Transactional
	public Menu saveNewMenu(Menu menu) {
		menuDAO.persist(menu);
		return menu;
	}

	@Transactional
	public Menu findMenuById(Long menuId) {
		try {
			Menu menu = menuDAO.findById(Menu.class, menuId);
			return menu;
		} catch (RecordNotFoundException rnfEx) {
			rnfEx.printStackTrace();
			throw new RecordNotFoundException(rnfEx);
		}
	}

	@Transactional
	public List<Menu> listMenuByResturant(Long resturantId) {
		LOGGER.info("...........List menus by resturant id......");
		List<Menu> menuList = menuDAO.findByNamedQuery(FIND_MENU_BY_REST_ID,
				new String[] { "resturantId" }, new Object[] { resturantId });
		LOGGER.info("..........." + menuList.size());
		return menuList;
	}

	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public void jsonifyMenu(Long resturantId, Long version) {
		LOGGER.info("...........List menus by resturant id......");
		List<Menu> menuList = menuDAO.findByNamedQuery(FIND_MENU_BY_REST_ID,
				new String[] { "resturantId" }, new Object[] { resturantId });
		LOGGER.info("..........." + menuList.size());
		LOGGER.info("........CONVERT MENU to JSON");
		
		Resturant restaurant = restaurantMgmtService.findById(resturantId);
		RestaurantDTO restDTO = ObjectTransformer.restaurantToDto(restaurant);
		List<MenuDTO> menuDTOList = new ArrayList<MenuDTO>();
		MenuDTO menuDTO = null;
		
		List<ItemCategoryDTO> categories = null;
		for (Menu menu : menuList) {
			menuDTO = ObjectTransformer.menuToDto(menu);
//			menuDTO.setRestaurant(restDTO);
			categories = categoryService.findCategories(menu.getMenuId());
			menuDTO.setCategories(categories);
			menuDTOList.add(menuDTO);
		}
		
		if(!menuList.isEmpty()){
			jsonMgmtService.jsonifyData(restaurant, menuDTOList, resturantId, 1L, JsonObjectType.MENU);
		}
	}

	
	@Transactional
	public List<MenuDTO> getMenuData(Long resturantId, Long version) {
		LOGGER.info("...........List menus by resturant id......");
		List<Menu> menuList = menuDAO.findByNamedQuery(FIND_MENU_BY_REST_ID,
				new String[] { "resturantId" }, new Object[] { resturantId });
		LOGGER.info("..........." + menuList.size());
		LOGGER.info("........CONVERT MENU to JSON");
		
		Resturant restaurant = restaurantMgmtService.findById(resturantId);
		RestaurantDTO restDTO = ObjectTransformer.restaurantToDto(restaurant);
		List<MenuDTO> menuDTOList = new ArrayList<MenuDTO>();
		MenuDTO menuDTO = null;
		
		List<ItemCategoryDTO> categories = null;
		for (Menu menu : menuList) {
			menuDTO = ObjectTransformer.menuToDto(menu);
//			menuDTO.setRestaurant(restDTO);
			categories = categoryService.findCategories(menu.getMenuId());
			menuDTO.setCategories(categories);
			menuDTOList.add(menuDTO);
		}

		return menuDTOList;
	}
	
	
	
	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public ObjectJson findMenuAsJson(Long restaurantId, Long version,
			Long languageId) {
		try{
			ObjectJson jsonData = jsonMgmtService.findJSON(restaurantId, JsonObjectType.MENU, languageId, version);
			return jsonData;
		}catch(RecordNotFoundException rnfEx){
			throw new RecordNotFoundException(rnfEx);
		}
	}
	
}
