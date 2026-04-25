package com.armedialab.entity

class Address implements Serializable {

	String description
	String street
	String area
	String poBox
	String phone1
	String phone2
	String phone3
	String phone4
	String lat
	String lon
	Boolean isActive = true
	String email
	String mapsUrl
	
	//static hasMany = [staffs: Staff]
	static belongsTo = [branch: Branch, country: Country, city: City]
	
	static mapping = {
		id column: "ADDRESS_ID"
	}

	static constraints = {
		email nullable: true, email: true, maxSize: 100
		street nullable: true, maxSize: 255
		area nullable: true, maxSize: 255
		city nullable: true
		country nullable: true
		poBox nullable: true, maxSize: 15
		phone1 nullable: true, maxSize: 20
		phone2 nullable: true, maxSize: 20
		phone3 nullable: true, maxSize: 20
		phone4 nullable: true, maxSize: 20
		lat nullable: true, maxSize: 25
		lon nullable: true, maxSize: 25
		mapsUrl nullable: true, maxSize: 2000
		isActive nullable: true
		description nullable: true, maxSize: 255
	}
	
}
