package com.armedialab.entity

import org.grails.databinding.BindingFormat

class Restaurant {

	String name
	String restaurantCode
	String theme
	String activationKey
	
	@BindingFormat('yyyy-MM-dd hh:mm')
	Date activationDate
	Integer billingPeriod
	boolean accountBlocked
	boolean accountCancelled
	boolean accountDeleted
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated
	String actionType
	AccountType accountType
	String bgImage
	String bgImageThumbnail
	String originalBgImage

	String logoSmall
	String logoLarge
	boolean autoApproveOrders = false

	static hasMany = [addons: Addon,
	                  branches: Branch,
	                  cuisineTypes: CuisineType,
	                  customers: Customer,
	                  feedbackConfigs: FeedbackConfig,
	                  ingredients: Ingredient,
	                  itemCategories: ItemCategory,
	                  menus: Menu,
	                  orders: Orders,
	                  restaurantDevices: RestaurantDevice,
	                  restaurantLanguages: RestaurantLanguage,
	                  restaurantTranslations: RestaurantTranslation,
	                  specialDeals: SpecialDeal,
	                  spiceTypes: SpiceType,
	                  staffs: Staff,
	                  variants: Variant]
	static belongsTo = [AccountType/*, User*/]

	static mapping = {
		id column: "RESTAURANT_ID"
	}

	static constraints = {
		restaurantCode nullabe: false, blank: false, size: 3..50, unique: true
		theme nullable: true, blank: true, maxSize: 100
		bgImage nullable: true
		bgImageThumbnail nullable: true
		originalBgImage nullable: true
		activationKey nullable: true, maxSize: 100, unique: true
		activationDate nullable: true
		billingPeriod nullable: true
		accountBlocked nullable: true
		accountCancelled nullable: true
		accountDeleted nullable: true
		lastUpdated nullable: true
		actionType nullable: true, maxSize: 50
		updatedBy nullable: true
		createdBy nullable: true
		logoLarge nullable: true
		logoSmall nullable: true
		
	}
	
	def getActiveBranches() {
		Branch.findAllByRestaurantAndIsActive(this, true, [sort: "name", order: "asc"])
	}
	
	def getActiveTranslations() {
		RestaurantTranslation.findAllByRestaurant(this, [sort: "language", order: "asc"])
	}
	
	def getActiveEvents() {
		//TODO: This should consider the show start and end date of the event
		RestaurantEvent.findAllByRestaurantAndIsActive(this, true, [sort: "eventDate", order: "desc"])
	}
	
	def getActiveFeedbackConfigs() {
		FeedbackConfig.findAllByRestaurantAndIsActive(this, true, [sort: "id", order: "asc"])
	}
	
	def getActiveMenus() {
		Menu.findAllByRestaurantAndIsActiveAndIsDeleted(this, true, false, [sort: "id", order: "asc"])
	}
	
	public void setRestaurantCode(String code) {
		this.restaurantCode = code?.toUpperCase();
	}
	
	public String getRestuarantNameWithCode() {
		return "${name} [${restaurantCode}]"
	}
}
