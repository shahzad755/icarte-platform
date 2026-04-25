package com.armedialab.entity

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Country implements Serializable {

	/*static hasMany = [ports: Port, cities: City]*/
	
	String unCode
	String name
	Boolean enabled = Boolean.TRUE
	Date dateCreated
	Date lastUpdated

    static constraints = {
		unCode (maxSize: 2, unique: true)
		name (size: 2.. 100, unique: true)
		lastUpdated (nullable: true)
    }
	
	static mapping = {
		table "ref_country"
	}
	
	def setUnCode(String code) {
		this.unCode = code.toUpperCase()
	}
	
	def setName(String _name) {
		this.name = _name.toUpperCase()
	}

	def getCities() {
		City.findAllByCountry(this)
	}

	public int hashCode() {
		def hcb = new HashCodeBuilder(17, 37)
		hcb.append(name)
			.append(unCode)
			.append(isGCC)
		return hcb.toHashCode()
	}
	
	public boolean equals(o) {
		if (!o instanceof Country) {
			return false
		}
		def eb = new EqualsBuilder()
		eb.append(unCode, o.unCode)
		eb.append(name, o.name)
		eb.append(isGCC, o.isGCC)
		return eb.isEquals()
	}
    
    public String toString() {
        return "${name} - (${unCode})"
    }
}
