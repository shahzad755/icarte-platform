package com.armedialab.entity

import java.util.Date;

class OrderItemAddon {

	BigDecimal price
	String specialRemarks
	Integer quantity
	OrderItems orderItem
	ItemAddon itemAddon
	Date dateCreated
	Date lastUpdated
	String createdBy
	String updatedBy

	static belongsTo = [ItemAddon, OrderItems]

	static mapping = {
		id column: "ORDER_ITEM_ADDON_ID"
		orderItem column: "ORDER_ITEM_ID"
	}

	static constraints = {
		price blank: false, nullable: false, scale: 3
		specialRemarks nullable: true, maxSize: 500
		quantity min: 1, max: 99
		updatedBy nullable: true
		lastUpdated nullable: true
	}
	
}
