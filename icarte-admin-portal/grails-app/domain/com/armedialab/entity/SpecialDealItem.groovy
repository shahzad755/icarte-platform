package com.armedialab.entity

class SpecialDealItem {

	Integer quantity
	SpecialDeal specialDeal
	Item item

	static hasMany = [orderSpecialDealItems: OrderSpecialDealItem]
	static belongsTo = [Item, SpecialDeal]

	static mapping = {
		id column: "MEAL_DEAL_ITEM_ID"
	}
}
