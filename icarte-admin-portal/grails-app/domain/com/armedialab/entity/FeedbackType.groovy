package com.armedialab.entity

class FeedbackType {

	String name
	String description
	Boolean isActive = true

	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated

	static hasMany = [feedbackConfigs: FeedbackConfig]

	static mapping = {
		id column: "FEEDBACK_TYPE_ID"
	}

	static constraints = {
		isActive nullable: true
		name maxSize: 100
		description nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
	}
	
	@Override
	public String toString() {
		return name
	}
}
