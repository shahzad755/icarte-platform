package com.armedialab.entity

class RestaurantLanguage {

	Integer isActive
	Date dateCreated
	Long createdBy
	Long updatedBy
	Date lastUpdated
	Restaurant restaurant
	RefLanguage language

	static belongsTo = [RefLanguage, Restaurant]

	static mapping = {
		id column: "RESTAURANT_LANGUAGE_ID"
	}

	static constraints = {
		isActive nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
	}
}
