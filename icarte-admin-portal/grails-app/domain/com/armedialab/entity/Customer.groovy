package com.armedialab.entity

import java.util.Date;

class Customer {

	String code
	String firstName
	String lastName
	String mobile
	String email
	Boolean subscribeNewsLetter = Boolean.FALSE
	Boolean isActive = Boolean.TRUE
	Date lastUpdated
	Date dateCreated
	String createdBy
	String updatedBy
	Restaurant restaurant

	static hasMany = [feedbackCustomers: FeedbackCustomer,
	                  orders: Orders]
	static belongsTo = [Restaurant]

	static mapping = {
		id column: "CUSTOMER_ID"
	}

	static constraints = {
		firstName nullable: true
		lastName nullable: true
		mobile nullable: true, maxSize: 15, unique: 'restaurant'
		email nullable: true, email: true, maxSize: 50
		subscribeNewsLetter nullable: true
		createdBy nullable: true
		dateCreated nullable: true
		isActive nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
	}

	public void setCode(String code) {
		this.code = code?.toUpperCase();
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName?.toUpperCase();
	}

	public void setLastName(String lastName) {
		this.lastName = lastName?.toUpperCase();
	}
	
	
}
