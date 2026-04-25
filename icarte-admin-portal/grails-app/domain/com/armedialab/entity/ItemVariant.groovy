package com.armedialab.entity

import com.armedialab.util.Constants

class ItemVariant {

	BigDecimal price
	BigDecimal discountRate = BigDecimal.ZERO
	Integer approxPreperationTime
	Boolean isPrimary = Boolean.FALSE
	Boolean isActive = Boolean.TRUE
	Date dateCreated
	Date lastUpdated
	String createdBy
	String updatedBy
	String actionType
	Variant variant
	Item item
	
	String title
	String description

	static hasMany = [itemDiscounts: ItemDiscount,
	                  orderItemses: OrderItems, itemVariantTranslations: ItemVariantTranslation]
	static belongsTo = [Item, Variant]
		static transients = ['title', 'description']

	static mapping = {
		id column: "ITEM_VARIANT_ID"
		//itemVariantTranslations fetch: 'join'
	}

	static constraints = {
		//variant ()
		variant unique: 'item'
		price scale: 2, blank: false, nullable: false
		discountRate nullable: true, scale: 2
		isPrimary nullable: true
		isActive nullable: true
		approxPreperationTime nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		actionType nullable: true, maxSize: 50
	}

	public BigDecimal getDiscountedPrice() {
		return price.subtract(price.multiply(discountRate?:BigDecimal.ZERO).divide(100));
	}
	
	public ItemVariantTranslation getTranslation() {
		return ItemVariantTranslation.find("from ItemVariantTranslation itvTrans where itvTrans.itemVariant.id=? and itvTrans.language.id=?",
					[id, Constants.Languages.ENGLISH.getLanguagesId()])
	}

	/***
	 * This method is used to get all the languages in key value pairs based on language code
	 * @return all translations as map
	 */
	def getActiveTranslations() {
		def map = [:]
		def list = ItemVariantTranslation.findAllByItemVariant(this, [sort: "language.id", order: "asc"])
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
		return getTranslation()?.title
	}
	
	@Override
	public String toString(){
		String title = getDefaultTitle()
		return title?:''
	}

}
