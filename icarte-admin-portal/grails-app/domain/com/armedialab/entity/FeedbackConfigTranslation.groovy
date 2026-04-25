package com.armedialab.entity

class FeedbackConfigTranslation {

	String title
	String description
	boolean showDescription = false
	FeedbackConfig feedbackConfig
	RefLanguage language
	boolean isDefault
	
	static belongsTo = [FeedbackConfig, RefLanguage]

	static mapping = {
		id column: "FEEDBACK_CONFIG_TRANSLATION_ID"
	}

	static constraints = {
		language (unique:'feedbackConfig')
		description nullable: true
		showDescription nullable: true
		isDefault nullable: true
	}
}
