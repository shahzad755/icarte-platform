package com.icarte.dto;

import java.io.Serializable;

public class StaffDTO implements Serializable{

	private Long staffId;
	private String staffCode;
	private String firstName;
	private String middleName;
	private String lastName;
	private Long mobileId;
	public Long getStaffId() {
		return staffId;
	}
	public void setStaffId(Long staffId) {
		this.staffId = staffId;
	}
	public String getStaffCode() {
		return staffCode;
	}
	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Long getMobileId() {
		return mobileId;
	}
	public void setMobileId(Long mobileId) {
		this.mobileId = mobileId;
	}

	
	
}
