package com.icarte.module.category.service.impl;

import static com.icarte.commons.Constants.NamedQueries.FIND_CATEGORIES_BY_MENU_ID;
import static com.icarte.commons.Constants.NamedQueries.FIND_CATEGORIES_TRANS_BY_MENU_ID;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.ObjectTransformer;
import com.icarte.commons.Constants.JsonObjectType;
import com.icarte.domain.ItemCategory;
import com.icarte.domain.ItemCategoryTranslation;
import com.icarte.domain.Menu;
import com.icarte.domain.ObjectJson;
import com.icarte.domain.Resturant;
import com.icarte.dto.ItemCategoryDTO;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.category.dao.CategoryManagementDAO;
import com.icarte.module.category.dao.CategoryTranslationMgmtDAO;
import com.icarte.module.category.service.CategoryService;
import com.icarte.module.menu.service.JsonManagementService;
import com.icarte.module.menu.service.MenuManagementService;

@Service
public class CategoryServiceImpl implements CategoryService {

	/**
	 * Logger.
	 */
	private static final Log LOGGER = LogFactory.getLog(CategoryServiceImpl.class);

	@Autowired
	private CategoryManagementDAO categoryDAO;

	@Autowired
	private CategoryTranslationMgmtDAO categoryMgmtTransDao;
	
//	@Autowired
//	private MenuManagementService menuService;
	
	
	@Autowired
	private JsonManagementService jsonMgmtService;
	
	
	public List<ItemCategory> loadCategries(Long resturantId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(readOnly = true)
	public List<ItemCategory> loadCategoriedByMenu(Long menuId) {
		LOGGER.info("Loading categories by menu id");
		List<ItemCategory> items = categoryDAO.findByNamedQuery(
				FIND_CATEGORIES_BY_MENU_ID, new String[] { "menuId" },
				new Object[] { menuId });

		return items;
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public void jsonifyCategories(Long menuId, Long version, Long langId) {
//		try {
//			List<ItemCategory> itemCategories = categoryDAO
//					.findByNamedQuery(FIND_CATEGORIES_BY_MENU_ID,
//							new String[] { "menuId" }, new Object[] { menuId });
//			Menu menu = menuService.findMenuById(menuId);
//			Resturant retaurant = menu.getResturant();
//			List<ItemCategoryDTO> categoryDTOs = new ArrayList<ItemCategoryDTO>();
//			ItemCategoryDTO categoryDTO = null;
//			for (ItemCategory itemCategory : itemCategories) {
//				categoryDTO = ObjectTransformer.categoryToDto(itemCategory);
//				categoryDTOs.add(categoryDTO);
//			}
//			jsonMgmtService.jsonifyData(retaurant, categoryDTOs, 1L , 1L,JsonObjectType.ITEM_CATEGORY);
//		} catch (RecordNotFoundException rnfEx) {
//			rnfEx.printStackTrace();
//		}
	}

	
	@Transactional
	public List<ItemCategoryDTO> findCategories(Long menuId) {
		try {
			List<ItemCategory> itemCategories = categoryDAO
					.findByNamedQuery(FIND_CATEGORIES_BY_MENU_ID,
							new String[] { "menuId" }, new Object[] { menuId });
//			Menu menu = menuService.findMenuById(menuId);
//			Resturant retaurant = menu.getResturant();
			List<ItemCategoryDTO> categoryDTOs = new ArrayList<ItemCategoryDTO>();
			ItemCategoryDTO categoryDTO = null;
			for (ItemCategory itemCategory : itemCategories) {
				categoryDTO = ObjectTransformer.categoryToDto(itemCategory);
				categoryDTOs.add(categoryDTO);
			}
			return categoryDTOs;
		} catch (RecordNotFoundException rnfEx) {
			rnfEx.printStackTrace();
		}
		return null;
	}

	
	/**
	 * {@inheritDoc}
	 */
	public ObjectJson findCategoriesJson(Long menuId, Long version, Long langId) {
		return jsonMgmtService.findJSON(menuId, JsonObjectType.ITEM_CATEGORY, langId, version);
	}
	
}
