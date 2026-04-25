package com.armedialab.entity

import com.armedialab.util.Constants

class CuisineType {

	String imageUrl
	String smallIconUrl
	String originalImageName
	Boolean isActive = Boolean.TRUE
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	Restaurant restaurant

	static hasMany = [cuisineTranslations: CuisineTranslation,
	                  items: Item]
	static belongsTo = [Restaurant]

	static mapping = {
		id column: "CUISINE_TYPE_ID"
	}

	static constraints = {
		imageUrl nullable: true
		smallIconUrl nullable: true
		originalImageName nullable: true
		restaurant nullable: true
		createdBy nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		isActive nullable: true
	}
	
	def getActiveTranslations() {
		def map = [:]
		def list = CuisineTranslation.findAllByCuisineType(this, [sort: "language.id", order: "asc"])
		list.each {
			map["${it.language.code}"] = [translationId: it.id,
												title: it.title,
												description: it.description,
												languageId: it.language.id]
		}
		return map
	}
	
	public String getDefaultTitle() {
		return CuisineTranslation.find("from CuisineTranslation cTrans where cTrans.cuisineType.id=? and cTrans.language.id=?",
					[id, Constants.Languages.ENGLISH.getLanguagesId()])?.title
	}
	
	@Override
	public String toString(){
		String title = getDefaultTitle()
		return title?:''
	}

}
