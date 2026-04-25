package com.armedialab.entity

class RestaurantTranslation {

	String title
	String description
	Boolean showDescription
	Restaurant restaurant
	RefLanguage language

	static belongsTo = [RefLanguage, Restaurant]

	static mapping = {
		id column: "RESTAURANT_TRANS_ID"
	}

	static constraints = {
		language nullable: false, blank: false, unique: 'restaurant'
		showDescription nullable: true
		description nullable: true, maxSize: 2000
	}
}
