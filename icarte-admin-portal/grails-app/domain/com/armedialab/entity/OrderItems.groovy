package com.armedialab.entity



class OrderItems {

	Long quantity
	String specialRemarks
	BigDecimal orderPrice
	BigDecimal discountAppliedPct = BigDecimal.ZERO
	ItemVariant itemVariant
	Item item
	Orders order
	Date dateCreated
	Date lastUpdated
	String createdBy
	String updatedBy

	static belongsTo = [Item, ItemVariant, Orders]
	static hasMany = [orderItemAddons: OrderItemAddon]

	static mapping = {
		id column: "ORDER_ITEM"
	}

	static constraints = {
		specialRemarks nullable: true, maxSize: 500
		item nullable: true
		discountAppliedPct nullable: true
		orderPrice blank: false, nullable: false, scale: 3
		quantity min: 1L, max: 99L
		updatedBy nullable: true
		lastUpdated nullable: true
	}
	
	public void applyDiscount() {
		discountAppliedPct = itemVariant.discountRate?:BigDecimal.ZERO
		orderPrice = itemVariant.getDiscountedPrice().multiply(quantity)
		/*
			BigDecimal price = new BigDecimal(52)
			BigDecimal pctDiscount = new BigDecimal(8)
			Integer quantity = 10
			
			BigDecimal discountedPrice = 
                            price.multiply(quantity)
                            .subtract(
                                price.multiply(quantity)
                                .multiply(pctDiscount)
                                .divide(100)
                             )
                             ;
​		 
		 */
	}
	
}
