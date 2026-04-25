package com.armedialab.entity

import com.armedialab.util.Constants

class Addon implements Serializable {

	Boolean isActive = Boolean.TRUE
	BigDecimal defaultPrice
	String imageUrl
	Date dateCreated
	String createdBy
	String updtaedBy
	Date lastUpdated
	Restaurant restaurant
	String title
	String description
	Boolean showDescription
	
	static hasMany = [itemAddons: ItemAddon, addonTranslations: AddonTranslation]
	static belongsTo = [Restaurant]
	static transients = ['title', 'description', 'showDescription']
	
	static mapping = {
		id column: "ADDON_ID"
	}

	static constraints = {
		isActive nullable: true
		defaultPrice scale: 2
		imageUrl nullable: true
		updtaedBy nullable: true
		lastUpdated nullable: true
		createdBy nullable: true
		restaurant nullable: true
	}
	
	/***
	 * This method is used to get all the languages in key value pairs based on language code
	 * @return all translations as map
	 */
	def getActiveTranslations() {
		def map = [:]
		def list = AddonTranslation.findAllByAddon(this, [sort: "language.id", order: "asc"])
		list.each {
			map["${it.language.code}"] = [translationId: it.id,
												title: it.title,
												description: it.description,
												languageId: it.language.id,
												showDescription: it.showDescription]
		}
		return map
	}
	
	public String getDefaultTitle() {
		return AddonTranslation.find("from AddonTranslation aTrans where aTrans.addon.id=? and aTrans.language.id=?",
					[id, Constants.Languages.ENGLISH.getLanguagesId()])?.title
	}
	
	@Override
	public String toString(){
		String title = getDefaultTitle()
		return title?:''
	}

}
