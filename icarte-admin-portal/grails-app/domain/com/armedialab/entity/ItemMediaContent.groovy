package com.armedialab.entity

class ItemMediaContent {

	String imageName
	String imageNameSmall
	String imageNameOriginal
	String videoUrl
	Integer displayOrder
	Boolean isActive = true
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	VideoSourceType videoSourceType
	Item item

	static belongsTo = [Item, VideoSourceType]

	static mapping = {
		id column: "ITEM_MEDIA_ID"
	}

	static constraints = {
		imageName nullable: true
		imageNameSmall nullable: true
		imageNameOriginal nullable: true
		videoUrl nullable: true
		videoSourceType nullable: true
		isActive nullable: true
		updatedBy nullable: true
		displayOrder nullable: true
	}
}
