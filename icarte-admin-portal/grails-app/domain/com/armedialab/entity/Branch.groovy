package com.armedialab.entity


class Branch implements Serializable{

	Long managerId
	Boolean isActive
	String branchCode
	String name
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated
	Restaurant restaurant
	Address address

	static hasMany = [
						menus: Menu, orders: Orders,
						servingTables: ServingTable,
						staffs: Staff]
	static belongsTo = [Restaurant]
	static hasOne = [address: Address]

	static mapping = {
		id column: "BRANCH_ID"
		address fetch: 'join'
	}

	static constraints = {
		isActive nullable: true
		branchCode nullabe: false, blank: false, size: 3..50, unique: 'restaurant'
		name nullable: true, maxSize: 45
		updatedBy nullable: true
		lastUpdated nullable: true
		managerId nullable: true
		restaurant nullable: true
		createdBy nullable: true
	}
	
	def getActiveMenus() {
		Menu.findAllByBranchAndIsActiveAndIsDeleted(this, true, false, [sort: "id", order: "asc"])
	}
	
	public String getNameWithRestuarant() {
		return "${name} (${restaurant.restaurantCode} - ${restaurant.name} )"
	}
	
	public String toString() {
		return "${branchCode}: ${name}"
	}
}
