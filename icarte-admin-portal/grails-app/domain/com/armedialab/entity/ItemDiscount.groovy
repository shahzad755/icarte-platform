package com.armedialab.entity

class ItemDiscount {

	BigDecimal discountPrice
	Date effectiveFromDate
	Date effectiveToDate
	Boolean isActive = Boolean.TRUE
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	ItemVariant itemVariant

	static belongsTo = [ItemVariant]

	static mapping = {
		id column: "ITEM_DISCOUNT_ID"
	}

	static constraints = {
		discountPrice blank: false, nullable: false, scale: 2
		updatedBy nullable: true
		lastUpdated nullable: true
	}
}
