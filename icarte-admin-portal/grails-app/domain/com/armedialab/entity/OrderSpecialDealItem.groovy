package com.armedialab.entity

import java.util.Date;

class OrderSpecialDealItem {

	Integer quantity
	String specialRemarks
	BigDecimal orderPrice
	SpecialDealItem specialDealItem
	Orders order
	Date dateCreated
	Date lastUpdated
	String createdBy
	String updatedBy

	static belongsTo = [Orders, SpecialDealItem]

	static mapping = {
		id column: "ORDER_SPECIAL_DEAL_ITEM_ID"
	}

	static constraints = {
		specialRemarks nullable: true
		orderPrice blank: false, nullable: false, scale: 3
		updatedBy nullable: true
		lastUpdated nullable: true
	}
}
