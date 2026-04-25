package com.armedialab.entity

class RestaurantEventTranslation {

	String title
	String description
	Boolean showDescription
	RestaurantEvent restaurantEvent
	RefLanguage language

	static belongsTo = [RestaurantEvent, RefLanguage]

	static constraints = {
		language nullable: false, blank: false, unique: 'restaurantEvent'
		title nullable: false, blank: false
		description nullable: false
		showDescription nullable: true
	}
}
