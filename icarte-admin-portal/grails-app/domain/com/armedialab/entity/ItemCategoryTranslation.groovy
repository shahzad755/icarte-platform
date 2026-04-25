package com.armedialab.entity

class ItemCategoryTranslation {

	String title
	String description
	Boolean showDescription
	ItemCategory itemCategory
	RefLanguage language

	static belongsTo = [ItemCategory, RefLanguage]

	static mapping = {
		id column: "ITEM_CATEGORY_TRANS_ID"
	}

	static constraints = {
		language nullable: false, blank: false, unique: 'itemCategory'
		title nullable: true
		description nullable: true
		showDescription nullable: true
	}
}
