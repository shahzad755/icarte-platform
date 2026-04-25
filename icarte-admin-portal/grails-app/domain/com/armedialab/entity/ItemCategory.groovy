package com.armedialab.entity

import org.grails.databinding.BindingFormat;

import com.armedialab.util.Constants;

class ItemCategory {

	String mappingCode
	String imageUrl
	String smallIconUrl
	String originalImageName
	ItemCategory parentCategory
	String tags
	
	@BindingFormat('yyyy-MM-dd hh:mm')
	Date availableDurationStart
	
	@BindingFormat('yyyy-MM-dd hh:mm')
	Date availableDurationEnd
	Boolean isActive
	Integer displayOrder
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	String actionType
	Restaurant restaurant

	static hasMany = [menuItemCategories: MenuItemCategory, itemCategoryTranslations: ItemCategoryTranslation, items: Item]
	static belongsTo = [Menu, Restaurant]
	static mappedBy = [parentCategory: "none"];

	static mapping = {
		id column: "ITEM_CATEGORY_ID"
	}

	static constraints = {
		menuItemCategories nullable: true
		mappingCode nullable: true
		displayOrder nullable: true
		imageUrl nullable: true
		smallIconUrl nullable: true
		originalImageName nullable: true
		parentCategory nullable: true
		tags nullable: true, maxSize: 500
		availableDurationStart nullable: true
		availableDurationEnd nullable: true
		isActive nullable: true
		updatedBy nullable: true
		actionType nullable: true, maxSize: 50
		createdBy nullable: true
		restaurant nullable: true
	}
	
	def getTranslations() {
		def map = [:]
		def list = ItemCategoryTranslation.findAllByItemCategory(this, [sort: "language", order: "asc"])
		list.each {
			map["${it.language.code}"] = [translationId: it.id,
												title: it.title,
												description: it.description,
												languageId: it.language.id]
		}
		return map
	}
	
	def getCurrentItemCategoryMenus() {
		return MenuItemCategory.findAllByItemCategoryAndIsDeleted(this, false)
	}
	
	public String getDefaultTitle() {
		return ItemCategoryTranslation.find("from ItemCategoryTranslation iTrans where iTrans.itemCategory.id=? and iTrans.language.id=?", 
					[id, Constants.Languages.ENGLISH.getLanguagesId()])?.title		
	}
	
	@Override
	public String toString(){
		String title = getDefaultTitle()
		return title?:''
	}
}
