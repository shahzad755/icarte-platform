package com.icarte.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MenuDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long menuId;
	private boolean isActive;
	private String name;
	private List<ItemCategoryDTO> categories = new ArrayList<ItemCategoryDTO>();
	
	private List<SpecialDealDTO> specialDeals = new ArrayList<SpecialDealDTO>();
	
	
	
	
	
	public List<SpecialDealDTO> getSpecialDeals() {
		return specialDeals;
	}

	public void setSpecialDeals(List<SpecialDealDTO> specialDeals) {
		this.specialDeals = specialDeals;
	}

	public List<ItemCategoryDTO> getCategories() {
		return categories;
	}
	
	public void setCategories(List<ItemCategoryDTO> categories) {
		this.categories = categories;
	}
	
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
