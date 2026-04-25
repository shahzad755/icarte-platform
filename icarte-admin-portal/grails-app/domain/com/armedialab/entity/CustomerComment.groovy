package com.armedialab.entity

import java.util.Date;

class CustomerComment {

	String customerContact
	String customerName
	String commentType
	String comments
	Date dateCreated
	Date lastUpdated
	String createdBy
	String updatedBy
	Boolean isActive = Boolean.TRUE
	Restaurant restaurant
	RestaurantDevice device
	
	static belongsTo = [Restaurant, RestaurantDevice]
	
	static mapping = {
		id column: "CUSTOMER_COMMENT_ID"
	}

	static constraints = {
		dateCreated nullable: true
		updatedBy nullable: true
		comments nullable: true, maxSize: 1000
	}
}
