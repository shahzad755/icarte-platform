package com.armedialab.entity

import org.grails.databinding.BindingFormat

import com.armedialab.util.Constants

class RestaurantEvent {

	@BindingFormat('yyyy-MM-dd hh:mm')
	Date eventDate
	
	@BindingFormat('yyyy-MM-dd')
	Date showEventStartDate
	
	@BindingFormat('yyyy-MM-dd')
	Date showEventEndDate

	String imageUrl
	String smallIconUrl
	String originalImageName
	Boolean isActive = true
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	Restaurant restaurant

	String title
	String description
	Boolean showDescription

	static hasMany = [restaurantEventTranslations: RestaurantEventTranslation]
	static belongsTo = [Restaurant]
	static transients = ['title', 'description', 'showDescription']
	
    static constraints = {
		eventDate(blank: false, nullable: false)
		showEventStartDate nullable:true
		showEventEndDate nullable:true
		imageUrl nullable:true
		smallIconUrl nullable:true
		originalImageName nullable:true
		updatedBy nullable: true
		lastUpdated nullable: true
		createdBy nullable: true
		restaurant nullable: true
    }
	
	def getActiveTranslations() {
		def map = [:]
		def list = RestaurantEventTranslation.findAllByRestaurantEvent(this, [sort: "language.id", order: "asc"])
		list.each {
			map["${it.language.code}"] = [translationId: it.id, 
												title: it.title, 
												description: it.description,
												languageId: it.language.id]
		}
		return map
	}
	

	public String getDefaultTitle() {
		return RestaurantEventTranslation.find("from RestaurantEventTranslation rTrans where rTrans.restaurantEvent.id=? and rTrans.language.id=?",
					[id, Constants.Languages.ENGLISH.getLanguagesId()])?.title
	}
	
}
