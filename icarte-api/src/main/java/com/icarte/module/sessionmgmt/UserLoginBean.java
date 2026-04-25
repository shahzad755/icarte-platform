package com.icarte.module.sessionmgmt;

import java.io.Serializable;

public class UserLoginBean implements Serializable{

	private static final long serialVersionUID = 2462300869914404143L;

	private String userName;
	private String password;
	private String deviceId;

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getDeviceId() {
		return deviceId;
	}
	
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
	
}
