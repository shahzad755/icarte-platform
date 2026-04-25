package com.armedialab.entity

class VariantTranslation {

	String title
	String description
	Boolean showDescription
	Boolean isDefault

	Variant variant
	RefLanguage language

	static belongsTo = [RefLanguage, Variant]

	static mapping = {
		id column: "VARIANT_TRANS_ID"
	}

	static constraints = {
		language()
		title()
		variant()
		description nullable: true
		showDescription nullable: true
	}
}
