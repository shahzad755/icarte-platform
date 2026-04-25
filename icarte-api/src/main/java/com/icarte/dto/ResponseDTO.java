package com.icarte.dto;

import java.io.Serializable;

public class ResponseDTO<T> implements Serializable{

    private Boolean isSuccess;

    /**
     * HTTP Response Code from Server
     */
    private String responseCode;

    /**
     * Request Type of the request that was sent to the server
     */
    private String requestType;

    /**
     * Response Model
     */
    private T model;

    /**
     * Error details in case the isSuccess was false
     */
    private String errorDetails;

	public String getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public T getModel() {
		return model;
	}

	public void setModel(T model) {
		this.model = model;
	}

	public String getErrorDetails() {
		return errorDetails;
	}

	public void setErrorDetails(String errorDetails) {
		this.errorDetails = errorDetails;
	}

	public Boolean getIsSuccess() {
		if(null == isSuccess)return false;
		return isSuccess;
	}

	public void setIsSuccess(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	
    

}
