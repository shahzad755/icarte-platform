package com.armedialab.entity

import java.util.Date;

import com.armedialab.util.Constants;

class FeedbackConfig {

	Restaurant restaurant
	FeedbackType feedbackType
	String title
	String description
	Boolean isRequired = false
	Boolean isActive = true
	
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated
	
	static hasMany = [feedbackConfigTranslations: FeedbackConfigTranslation,
	                  feedbackCustomers: FeedbackCustomer]
	static belongsTo = [FeedbackType, Restaurant]
	static transients = ['title', 'description']

	static mapping = {
		id column: "FEEDBACK_CONFIG_ID"
	}

	static constraints = {
		feedbackType()
		isRequired nullable: true
		isActive nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
	}
	
	def getActiveTranslations() {
		def map = [:]
		def list = FeedbackConfigTranslation.findAllByFeedbackConfig(this, [sort: "language.id", order: "asc"])
		list.each {
			map["${it.language.code}"] = [translationId: it.id,
												title: it.title,
												description: it.description,
												languageId: it.language.id]
		}
		return map
	}
	
	public FeedbackConfigTranslation getTranslation() {
		return FeedbackConfigTranslation.find("from FeedbackConfigTranslation fcTrans where fcTrans.feedbackConfig=? and fcTrans.language=?",
					[this, RefLanguage.load(Constants.Languages.ENGLISH.getLanguagesId())])
	}

	public String getDefaultTitle() {
		return getTranslation()?.title
	}
	
}
