package com.armedialab.entity

class Configurations {

	String status
	Date dateCreated
	Date lastUpdated
	Integer accountId
	String configurationName
	String content
	Integer numRowsGenerated

	static mapping = {
		id column: "configuration_id"
	}

	static constraints = {
		configurationName maxSize: 100
		content maxSize: 16777215
		numRowsGenerated nullable: true
	}
}
