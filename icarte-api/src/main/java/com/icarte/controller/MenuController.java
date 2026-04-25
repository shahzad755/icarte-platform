package com.icarte.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icarte.domain.ItemCategory;
import com.icarte.module.category.service.CategoryService;
import com.icarte.module.item.service.ItemManagementService;
import com.icarte.module.menu.service.JsonManagementService;
import com.icarte.module.menu.service.MenuManagementService;

@Controller
public class MenuController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ItemManagementService itemManagementService;
	
	
	@Autowired
	private JsonManagementService jsonifyServiceImpl;
	
	@Autowired
	private MenuManagementService menuService;
	
	@RequestMapping(value = "/welcome/menuId/{menuId}", produces = "application/json" ,  method = RequestMethod.GET)
	public @ResponseBody ItemCategory defaultPage(@PathVariable(value="menuId")Long menuId) {

		
		menuService.jsonifyMenu(1L, 1L);
		categoryService.jsonifyCategories(1L , 1L , 1L);
		
		itemManagementService.jsonifyItems(1L, 1L);
		
		
//		List<ItemCategory> items = service.loadCategoriedByMenu(menuId);
		// ModelAndView model = new ModelAndView();
		// model.addObject("title", "Spring Security + Hibernate Example");
		// model.addObject("message", "This is default page!");
		// model.addObject("data", "This is default page!");
		// model.setViewName("hello");
		return new ItemCategory();

	}

}
