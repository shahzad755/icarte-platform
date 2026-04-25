package com.armedialab.entity

import com.armedialab.util.Constants

class SpiceType {

	String imageUrl
	Boolean isActive = Boolean.TRUE
	Restaurant restaurant

	static hasMany = [items: Item,
	                  spiceTypeTranslations: SpiceTypeTranslation]
	static belongsTo = [Restaurant]

	static mapping = {
		id column: "SPICE_TYPE_ID"
	}

	static constraints = {
		imageUrl nullable: true
		isActive nullable: true
	}

	def getActiveTranslations() {
		def map = [:]
		def list = SpiceTypeTranslation.findAllBySpiceType(this, [sort: "language.id", order: "asc"])
		list.each {
			map["${it.language.code}"] = [translationId: it.id,
												title: it.title,
												description: it.description,
												languageId: it.language.id]
		}
		return map
	}
	
	public String getDefaultTitle() {
		return SpiceTypeTranslation.find("from SpiceTypeTranslation spTrans where spTrans.spiceType.id=? and spTrans.language.id=?",
					[id, Constants.Languages.ENGLISH.getLanguagesId()])?.title
	}
	
	@Override
	public String toString(){
		String title = getDefaultTitle()
		return title?:''
	}

}
