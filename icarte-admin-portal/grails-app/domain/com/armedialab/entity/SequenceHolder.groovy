package com.armedialab.entity

class SequenceHolder {

	Integer entityType
	String seqName
	Long nextVal

	static mapping = {
		version false
	}

	static constraints = {
		entityType unique: true
		seqName maxSize: 45
	}
}
