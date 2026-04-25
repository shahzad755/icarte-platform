package com.armedialab.entity


class ServingTableRequestStatus {

	ServingTable servingTable
	RestaurantDevice restaurantDevice
	Branch branch
	Customer customer
	Staff staff
	StatusType statusType
	int requestCount = 0
	
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated

	static belongsTo = [ServingTable, RestaurantDevice, Branch, Customer, Staff, StatusType]
	static constraints = {
		customer nullable: true
		updatedBy nullable: true
		lastUpdated nullable: true
		staff nullable: true
    }
}
