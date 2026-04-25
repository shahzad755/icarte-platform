package com.armedialab.entity

class Ingredient {

	String imageUrl
	Integer isActive
	Date lastUpdated
	Long createdBy
	Long updatedBy
	Date dateCreated
	Restaurant restaurant

	static hasMany = [ingredientTranslations: IngredientTranslation,
	                  itemIngredients: ItemIngredient]
	static belongsTo = [Restaurant]

	static mapping = {
		id column: "INGREDIENT_ID"
	}

	static constraints = {
		isActive nullable: true
		updatedBy nullable: true
	}
}
