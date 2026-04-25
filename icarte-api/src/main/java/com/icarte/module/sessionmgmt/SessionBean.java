package com.icarte.module.sessionmgmt;

import java.io.Serializable;

import com.icarte.domain.Users;

public class SessionBean implements Serializable {

	private static final long serialVersionUID = 2440984484568865347L;
	private Users logedinUser;

	private String errorMessage;
	
	public Users getLogedinUser() {
		return logedinUser;
	}
	
	public void setLogedinUser(Users logedinUser) {
		this.logedinUser = logedinUser;
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}
	
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
}
