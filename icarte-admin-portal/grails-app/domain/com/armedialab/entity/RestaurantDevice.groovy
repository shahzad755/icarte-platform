package com.armedialab.entity

import java.util.Date;

class RestaurantDevice {

	String deviceId
	String deviceManufecturer
	String registrationCode
	Date blockedOn
	String blockedBy
	Integer applicationMode = 1
	ServingTable servingTable
	Boolean isCustContactMandatory
	Branch branch
	Restaurant restaurant
	
	Date lastLoginTime
	Boolean isBlocked = false
	
	Date dateCreated
	String createdBy
	String updatedBy
	Date lastUpdated
	Boolean isActive = true

	static belongsTo = [Restaurant, Branch, ServingTable]

	static mapping = {
		id column: "RESTAURANT_DEVICE_ID"
		applicationMode sqlType: "int", length: 1
	}

	static constraints = {
		registrationCode nullable: true
		deviceId(size: 10..50, unique: true)
		applicationMode(inList: [1, 2, 3])
		servingTable nullable: true
		deviceManufecturer nullable: true
		isCustContactMandatory nullable: true
		lastLoginTime nullable: true
		isBlocked nullable: true
		createdBy nullable: true
		restaurant nullable: true
		blockedOn nullable: true
		lastUpdated nullable: true
		updatedBy nullable: true
		blockedBy nullable: true
	}	
	public void setIsBlocked(Boolean isBlocked) {
		if(this.isBlocked) {
			this.setBlockedOn(new Date())
		} else {
			this.setBlockedOn(null)
		}
		this.isBlocked = isBlocked;
	}	
}
