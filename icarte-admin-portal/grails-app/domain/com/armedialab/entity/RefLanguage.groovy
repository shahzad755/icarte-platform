package com.armedialab.entity

class RefLanguage {

	String name
	String code
	Integer isActive

	static hasMany = [addonTranslations: AddonTranslation,
	                  cuisineTranslations: CuisineTranslation,
	                  feedbackConfigTranslations: FeedbackConfigTranslation,
	                  ingredientTranslations: IngredientTranslation,
	                  itemCategoryTranslations: ItemCategoryTranslation,
	                  restaurantLanguages: RestaurantLanguage,
	                  restaurantTranslations: RestaurantTranslation,
	                  specialDealTranslations: SpecialDealTranslation,
	                  spiceTypeTranslations: SpiceTypeTranslation]

	static mapping = {
		id column: "LANGUAGE_ID"
	}

	static constraints = {
		name maxSize: 25
		code maxSize: 4
		isActive nullable: true
	}
	
	public String toString() {
		return "${name} - (${code})"
	}
}
