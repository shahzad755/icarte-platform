package com.armedialab.entity

import com.armedialab.util.Constants.StatusTypeEnum;


class Orders {

	String referenceNum
	Date orderDate
	String specialRemarks
	String cancellationReason
	BigDecimal totalPrice
	BigDecimal discountAppliedPct = BigDecimal.ZERO
	Staff staff
	Branch branch
	Restaurant restaurant
	Customer customer
	ServingTable servingTable
	StatusType statusType
	String statusChangeReason
	Boolean isActive
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated

	static hasMany = [orderItemses: OrderItems,
	                  orderSpecialDealItems: OrderSpecialDealItem]
	static belongsTo = [Branch, Customer, Restaurant, ServingTable, Staff, Orders]

	static mapping = {
		id column: "ORDER_ID"
	}

	static constraints = {
		referenceNum  maxSize: 25, unique: 'restaurant'
		specialRemarks nullable: true, maxSize: 500
		cancellationReason nullable: true, maxSize: 500
		discountAppliedPct nullable: true, scale: 2
		updatedBy nullable: true
		lastUpdated nullable: true
		createdBy nullable: true
		statusChangeReason nullable: true
	}
	
	public void setReferenceNum(String referenceNum) {
		this.referenceNum = referenceNum?.toUpperCase();
	}

	public void updateCalculations() {
		BigDecimal orderTotal = new BigDecimal(0)
		BigDecimal addonsTotal = new BigDecimal(0)
		def addon
		orderItemses?.each { orderItem ->
			orderItem.orderItemAddons?.each { orderItemAddon ->
				addonsTotal = addonsTotal.add(orderItemAddon.price)
			}
			orderTotal = orderTotal.add(orderItem.orderPrice)
		}
		//now add total of order items and order item addons
		orderTotal = orderTotal.add(addonsTotal)
		totalPrice = orderTotal
	}

/*	def beforeUpdate() { 
		println "Executing Before UPDATE"
		updateCalculations()  
		println "Before UPDATE executed"
	}
	def beforeInsert() { 
		println "Executing Before INSERT"
		updateCalculations()  
		println "Before INSERT executed"
	}
*/	
}
