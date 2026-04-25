package com.armedialab.user

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

import com.armedialab.entity.Staff

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	String firstName
	String middleName
	String lastName
	String email
	String passwordRecoveryQst
	String passwordRecoveryAns
	Date lastLoggedIn
	Date expiresOn
	Date dateCreated
	String createdBy
	Date lastUpdated
	String updatedBy
	
	String confirmPassword

	Staff staff
	
	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static hasOne = [staff: Staff]
	static transients = ['springSecurityService', 'confirmPassword']

	static constraints = {
		username blank: false, unique: true
		password(blank: false, nullable: false)
		createdBy blank: false
		passwordRecoveryQst nullable: true, maxSize: 100
		passwordRecoveryAns nullable: true, maxSize: 100
		lastLoggedIn nullable: true
		expiresOn nullable: true
		updatedBy nullable: true
		email nullable: true, email: true
		middleName nullable: true
		lastName nullable: true
		createdBy nullable: true
	}

	static mapping = {
		id column: "USER_ID"
	}
}
