package com.armedialab.entity

class MenuItemCategory {

	ItemCategory itemCategory
	Menu menu
	boolean isDeleted = false
	
	static belongsTo = [ItemCategory, Menu]

	static mapping = {
		id column: "MENU_ITEM_CATEGORY_ID"
		version false
	}
    static constraints = {
    }
}
