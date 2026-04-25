package com.armedialab.entity

class VideoSourceType {

	String name
	String description
	Boolean isActive = true

	static hasMany = [itemMediaContents: ItemMediaContent]

	static mapping = {
		id column: "VIDEO_SOURCE_TYPE_ID"
	}

	static constraints = {
		isActive nullable: true
		description nullable: true
	}
}
