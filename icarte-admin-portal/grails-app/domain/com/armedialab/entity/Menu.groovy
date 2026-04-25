package com.armedialab.entity

class Menu {

	String title
	Boolean isActive = Boolean.TRUE
	Boolean isDeleted = Boolean.FALSE
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	String actionType
	Branch branch
	Restaurant restaurant

	static hasMany = [menuItemCategories: MenuItemCategory]
	static belongsTo = [Restaurant, Branch]

	static mapping = {
		id column: "MENU_ID"
	}

	static constraints = {
		restaurant nullable: true
		isDeleted nullable: true
		lastUpdated nullable: true
		updatedBy nullable: true
		actionType nullable: true, maxSize: 50
	}
	
	def getActiveCategories() {
		ItemCategory.executeQuery('''Select ic from ItemCategory ic, MenuItemCategory mic  
										where 	ic.id = mic.itemCategory 
										and 	mic.menu = ? and ic.isActive = 1 order by ic.displayOrder asc''', [this])
	}
	
/*	def getActiveCategories() {
		ItemCategory.findAll("from ItemCategory as itemCat join itemCat.itemCategoryTranslations iTrans where itemCat.isActive = ? and itemCat.menu = ?  order by itemCat.displayOrder asc",
            [true, this])
 	}
*/	
	@Override
	public String toString() {
		return "${title?:''} - (Branch: ${branch?.branchCode}:${branch?.name})"
	}
}
