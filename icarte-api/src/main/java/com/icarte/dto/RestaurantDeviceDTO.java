package com.icarte.dto;

import java.io.Serializable;
import java.util.Date;

public class RestaurantDeviceDTO implements Serializable{
	private Long restaurantDeviceId;

	private long deviceId;
	private String deviceManufecturer;
	private Date lastLoginTime;
	private Integer isActive;
	private Date activatedOn;
	private Integer isBlocked;
	private Date blockedOn;
	private String activatedBy;
	private String blockedBy;
	private String registrationCode;
	private RestaurantDTO restaurant;
	public Long getRestaurantDeviceId() {
		return restaurantDeviceId;
	}
	public void setRestaurantDeviceId(Long restaurantDeviceId) {
		this.restaurantDeviceId = restaurantDeviceId;
	}
	public long getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(long deviceId) {
		this.deviceId = deviceId;
	}
	public String getDeviceManufecturer() {
		return deviceManufecturer;
	}
	public void setDeviceManufecturer(String deviceManufecturer) {
		this.deviceManufecturer = deviceManufecturer;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public Integer getIsActive() {
		return isActive;
	}
	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}
	public Date getActivatedOn() {
		return activatedOn;
	}
	public void setActivatedOn(Date activatedOn) {
		this.activatedOn = activatedOn;
	}
	public Integer getIsBlocked() {
		return isBlocked;
	}
	public void setIsBlocked(Integer isBlocked) {
		this.isBlocked = isBlocked;
	}
	public Date getBlockedOn() {
		return blockedOn;
	}
	public void setBlockedOn(Date blockedOn) {
		this.blockedOn = blockedOn;
	}
	public String getActivatedBy() {
		return activatedBy;
	}
	public void setActivatedBy(String activatedBy) {
		this.activatedBy = activatedBy;
	}
	public String getBlockedBy() {
		return blockedBy;
	}
	public void setBlockedBy(String blockedBy) {
		this.blockedBy = blockedBy;
	}
	public String getRegistrationCode() {
		return registrationCode;
	}
	public void setRegistrationCode(String registrationCode) {
		this.registrationCode = registrationCode;
	}
	public RestaurantDTO getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(RestaurantDTO restaurant) {
		this.restaurant = restaurant;
	}


}
