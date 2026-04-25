package com.armedialab.entity

class IngredientTranslation {

	String description
	String title
	Integer showDescription
	RefLanguage language
	Ingredient ingredient

	static belongsTo = [Ingredient, RefLanguage]

	static mapping = {
		id column: "INGREDIENT_TRANSLATION_ID", generator: "assigned"
	}

	static constraints = {
		description nullable: true
		showDescription nullable: true
	}
}
