package com.armedialab.entity

import com.armedialab.user.User

class Staff {

	String staffCode
	String mobile
	Boolean isActive = true
	String designation
	User user
	Branch branch
	Restaurant restaurant
	Address address

	static hasMany = [orders: Orders]
	static belongsTo = [Address, Branch, Restaurant, User]

	static mapping = {
		id column: "STAFF_ID"
	}

	static constraints = {
		staffCode maxSize: 10, unique: 'branch'
		mobile nullable: true
		isActive nullable: true
		designation nullable: true
		user nullable: true
		address nullable: true
	}
	
	public void setStaffCode(String code) {
		this.staffCode = code?.toUpperCase();
	}
	
	public void setBranch(Branch branch) {
		this.branch = branch
		if(branch)
			this.restaurant = branch.restaurant 
	}
}
