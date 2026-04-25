package com.armedialab.entity

import java.util.Date;
import java.io.Serializable

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder


class City implements Serializable {

	/*static belongsTo = [Country]*/
	
	String code
	String name
	String description
	Boolean enabled = Boolean.TRUE
	Date dateCreated
	Date lastUpdated
	Country country
	
    static constraints = {
		code (size: 1..10, unique: true)
		name(size: 2.. 100, unique: true)
		description (shared: 'description')
		lastUpdated (nullable: true)
    }

	static mapping = {
		table "ref_city"
	}
	
	public int hashCode() {
		def hcb = new HashCodeBuilder(17, 37)
		hcb.append(name)
			.append(code)
			.append(country)
		return hcb.toHashCode()
	}
	
	public boolean equals(o) {
		if (!o instanceof City) {
			return false
		}
		def eb = new EqualsBuilder()
		eb.append(code, o.code)
		eb.append(name, o.name)
		eb.append(country, o.country)
		return eb.isEquals()
	}
    
    public String toString() {
		return "${name} - (${code})"
    }
}
