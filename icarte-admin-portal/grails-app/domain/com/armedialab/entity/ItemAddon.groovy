package com.armedialab.entity

class ItemAddon {

	Addon addon
	Item item
	boolean isDeleted = false

	static hasMany = [orderItemAddons: OrderItemAddon]
	static belongsTo = [Addon, Item]

	static mapping = {
		id column: "ITEM_ADDON_ID"
	}
}
