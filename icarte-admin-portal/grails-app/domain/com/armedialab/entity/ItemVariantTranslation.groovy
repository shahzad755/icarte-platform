package com.armedialab.entity

class ItemVariantTranslation {

	String title
	String description
	String dietaryInformation
	Boolean showDescription =  Boolean.FALSE
	Boolean isDefault =  Boolean.FALSE
	RefLanguage language
	ItemVariant itemVariant

	static belongsTo = [ItemVariant, RefLanguage]

	static mapping = {
		id column: "ITEM_VAR_TRANSLATION_ID"
	}

	static constraints = {
		language blank: false, unique: 'itemVariant'
		title nullabe: false, blank: false
		description()
		dietaryInformation nullable: true, maxSize: 1000
		showDescription nullable: true
	}
}
