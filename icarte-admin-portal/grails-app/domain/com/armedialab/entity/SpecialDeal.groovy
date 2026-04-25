package com.armedialab.entity

class SpecialDeal {

	Date startDate
	Date endDate
	BigDecimal price
	String imageUrl
	Integer isActive
	Restaurant restaurant

	static hasMany = [specialDealItems: SpecialDealItem,
	                  specialDealTranslations: SpecialDealTranslation]
	static belongsTo = [Restaurant]

	static mapping = {
		id column: "SPECIAL_DEAL_ID"
	}

	static constraints = {
		price scale: 3
		imageUrl nullable: true
		isActive nullable: true
	}
}
