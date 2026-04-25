package com.armedialab.entity

class SpiceTypeTranslation {

	String description
	String title
	Boolean showDescription
	SpiceType spiceType
	RefLanguage language

	static belongsTo = [RefLanguage, SpiceType]

	static mapping = {
		id column: "SPICE_TYPE_TRANS_ID"
	}

	static constraints = {
		language()
		title()
		spiceType()
		description nullable: true
		showDescription nullable: true
	}
}
