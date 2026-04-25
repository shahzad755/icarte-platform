package com.armedialab.entity

class AccountType {

	String name
	String description
	Integer deviceNumAllowed
	Integer branchNumAllowed
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	Boolean isActive = true

	static hasMany = [restaurants: Restaurant]

	static mapping = {
		id column: "ACCOUNT_TYPE_ID"
	}

	static constraints = {
		name unique: true
		description nullable: true, maxSize: 500
		updatedBy nullable: true
		createdBy nullable: true
		lastUpdated nullable: true
		isActive nullable: true
	}
}
