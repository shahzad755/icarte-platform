package com.icarte.dto;

import java.util.List;

import com.icarte.domain.AccountType;

public class RestaurantDTO {
	private Long resturantId;
	private String activationKey;
	private String contactPerson;
	private String logoSmall;
	private String logoLarge;
	private String theme;
	private String backgroundImage;
	private AccountTypeDTO accountTypeDTO;

	
	private List<MenuDTO> menus;
	
	public List<MenuDTO> getMenus() {
		return menus;
	}
	public void setMenus(List<MenuDTO> menus) {
		this.menus = menus;
	}	
	
	
	public Long getResturantId() {

		return resturantId;
	}
	public void setResturantId(Long resturantId) {
		this.resturantId = resturantId;
	}
	public String getActivationKey() {
		return activationKey;
	}
	public void setActivationKey(String activationKey) {
		this.activationKey = activationKey;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getLogoSmall() {
		return logoSmall;
	}
	public void setLogoSmall(String logoSmall) {
		this.logoSmall = logoSmall;
	}
	public String getLogoLarge() {
		return logoLarge;
	}
	public void setLogoLarge(String logoLarge) {
		this.logoLarge = logoLarge;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getBackgroundImage() {
		return backgroundImage;
	}
	public void setBackgroundImage(String backgroundImage) {
		this.backgroundImage = backgroundImage;
	}
	public AccountTypeDTO getAccountTypeDTO() {
		return accountTypeDTO;
	}
	public void setAccountTypeDTO(AccountTypeDTO accountTypeDTO) {
		this.accountTypeDTO = accountTypeDTO;
	}
	
	
	
	
	
}
