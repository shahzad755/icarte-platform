package com.armedialab.entity

class AddonTranslation {

	String title
	String description
	Boolean showDescription = Boolean.FALSE
	Boolean isDefault
	Addon addon
	RefLanguage language

	static belongsTo = [RefLanguage, Addon]

	static mapping = {
		id column: "ADDON_TRNASLATION_ID"
	}

	static constraints = {
		language nullable: false, blank: false, min: 2, unique: 'addon'
		description nullable: true
		showDescription nullable: true
		isDefault nullable: true
	}
}
