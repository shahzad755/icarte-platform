package com.armedialab.user

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1
	String name
	String authority
	String description
	boolean isActive
	
	Role(String authority) {
		this()
		this.authority = authority
	}

	static constraints = {
		authority blank: false, unique: true
		name blank: false
		description nullable: true
	}

	static mapping = {
		id column: "ROLE_ID"
		cache true
	}
}
