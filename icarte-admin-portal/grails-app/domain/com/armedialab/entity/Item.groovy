package com.armedialab.entity

class Item {
	String code
	String mappingCode
	String tags
	Restaurant restaurant
	Boolean isActive = Boolean.TRUE
	Boolean isDeleted = Boolean.FALSE
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	String actionType
	SpiceType spiceType
	ItemCategory itemCategory
	CuisineType cuisineType
	Boolean isNew = Boolean.FALSE
	
	String title
	String description
	BigDecimal price
	String approxPreparationTime
	BigDecimal discountRate
	
	static hasMany = [itemAddons: ItemAddon,
	                  itemIngredients: ItemIngredient,
	                  itemMediaContents: ItemMediaContent,
	                  itemVariants: ItemVariant,
	                  orderItemses: OrderItems,
	                  specialDealItems: SpecialDealItem]
	static belongsTo = [Restaurant, CuisineType, ItemCategory, SpiceType]

	static transients = ['title', 'description', 'price', 'approxPreparationTime', 'primaryVariant', 'discountRate']
	static mapping = {
		id column: "ITEM_ID"
	}

	static constraints = {
		code nullabe: false, blank: false, size: 1..20, unique: 'restaurant'
		mappingCode nullable: true
		restaurant()
		itemCategory()
		cuisineType  nullable: true
		spiceType nullable: true
		tags nullable: true, maxSize: 500
		isActive nullable: true
		isDeleted nullable: true
		isActive nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		actionType nullable: true, maxSize: 50
		isNew nullable: true
	}
	
	def getCurrentItemAddons(){
		ItemAddon.findAllByItemAndIsDeleted(this, false)
	}
	
	def getActiveMediaContent(){
		ItemMediaContent.findAllByItemAndIsActive(this, true, [sort: "displayOrder", order: "asc"])
	}
	
	def getActiveVariants() {
		ItemVariant.findAll (sort: "isPrimary", order: "desc") {
			item == this &&
			isActive == true &&
			isPrimary == false
		}
	}
	
	public void setCode(String code) {
		this.code = code?.toUpperCase();
	}

	public void setMappingCode(String mappingCode) {
		this.mappingCode = mappingCode?.toUpperCase();
	}

	def getPrimaryVariant() {
		ItemVariant.findWhere(item: this, isPrimary: true)
	}
	
}
