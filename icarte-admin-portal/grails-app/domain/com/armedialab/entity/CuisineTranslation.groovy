package com.armedialab.entity

class CuisineTranslation {

	String title
	String description
	Boolean showDescription = Boolean.FALSE

	RefLanguage language
	CuisineType cuisineType

	static belongsTo = [CuisineType, RefLanguage]

	static mapping = {
		id column: "CUISINE_TRANS_ID"
	}

	static constraints = {
		language blank: false, unique: 'cuisineType'
		description nullable: true
		showDescription nullable: true
	}
}
