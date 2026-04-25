package com.armedialab.entity

class FeedbackCustomer {

	String customerContact
	String value
	String feedbackContext
	Long referenceId
	Date dateCreated
	FeedbackConfig feedbackConfig
	Customer customer
	//TODO: add order reference to handle all types of feedback in this domain

	static belongsTo = [Customer, FeedbackConfig]

	static mapping = {
		id column: "FEEDBACK_ID"
	}

	static constraints = {
		customerContact nullable: true
		feedbackContext nullable: true, maxSize: 20
		referenceId nullable: true
		dateCreated nullable: true
		value nullable: true, maxSize: 20
		customer nullable: true
	}
}
