package com.armedialab.emergency

import java.util.Date;

class UserProfile {

	String firstName;
	String lastName;
	String mobile;
	String qatariId;
	String bloodGroup;
	String nationality;
	String lat = "25.3224537";
	String lon = "51.435225";
	String requestType;
	Date dateCreated;
	Date lastUpdated;

	static constraints = {
		firstName nullable:true
		lastName nullable: true
		mobile nullable: true
		qatariId  nullable: true
		bloodGroup nullable: true
		nationality nullable: true
		lat nullable: true
		lon nullable: true
		requestType nullable: true
		dateCreated nullable: true
		lastUpdated nullable: true
    }
}
