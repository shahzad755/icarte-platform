package com.armedialab.entity

class SpecialDealTranslation {

	String title
	String description
	Integer showDescription
	String otherRemarks
	SpecialDeal specialDeal
	RefLanguage language

	static belongsTo = [RefLanguage, SpecialDeal]

	static mapping = {
		id column: "SPECIAL_DEAL_TRANSLATION_ID"
		version false
	}

	static constraints = {
		showDescription nullable: true
		otherRemarks nullable: true
	}
}
