package com.armedialab.entity

class ServingTable {

	String description
	String tableRefNumber
	Integer floor 
	Boolean isActive = true
	Branch branch

	static hasMany = [orders: Orders, servingTableRequestStatus: ServingTableRequestStatus]
	static belongsTo = [Branch/*, Restaurant*/]

	static mapping = {
		id column: "SERVING_TABLE_ID"
		version false
	}

	static constraints = {
		tableRefNumber unique: ['floor', 'branch']
		description nullable: true
		isActive nullable: true
	}
}
