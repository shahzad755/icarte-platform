package com.armedialab.entity

class ItemIngredient {

	Item item
	Ingredient ingredient

	static belongsTo = [Ingredient, Item]

	static mapping = {
		id column: "ITEM_INGREDIENT_ID"
	}
}
