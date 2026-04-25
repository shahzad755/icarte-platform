package com.armedialab.entity

import java.util.Date;

class VariantType {
	String name
	String description
	Boolean isActive = Boolean.TRUE
	Boolean isDefault = Boolean.FALSE
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated
	Restaurant restaurant

	static hasMany = [variants: Variant]

	static mapping = {
		id column: "VARIANT_TYPE_ID"
	}

	static constraints = {
		name maxSize: 100
		description nullable: true
		restaurant nullable: true
		isActive nullable: true
		createdBy nullable: true
		dateCreated nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		isDefault nullable: true
	}
}
