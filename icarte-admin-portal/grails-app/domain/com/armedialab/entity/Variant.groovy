package com.armedialab.entity

import com.armedialab.util.Constants

class Variant {

	String imageUrl
	Restaurant restaurant
	VariantType variantType
	Boolean isActive = Boolean.TRUE
	Boolean isDefault = Boolean.FALSE
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated

	static hasMany = [itemVariants: ItemVariant, variantTranslations: VariantTranslation]
	static belongsTo = [Restaurant, VariantType]

	static mapping = {
		id column: "VARIANT_ID"
	}

	static constraints = {
		variantType()
		restaurant nullable: true
		isActive nullable: true
		createdBy nullable: true
		dateCreated nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		imageUrl nullable: true
		isDefault nullable: true
	}
	
	public VariantTranslation getTranslation() {
		return VariantTranslation.find("from VariantTranslation vTrans where vTrans.variant.id=? and vTrans.language.id=?",
					[id, Constants.Languages.ENGLISH.getLanguagesId()])
	}

	public String getDefaultTitle() {
		return getTranslation()?.title
	}

	public String getDefaultTitleForAdmin() {
		return "${getTranslation()?.title} - [Restaurant: ${restaurant.restaurantCode}]"
	}

	@Override
	public String toString(){
		String title = getDefaultTitle()
		return title?:''
	}

}
