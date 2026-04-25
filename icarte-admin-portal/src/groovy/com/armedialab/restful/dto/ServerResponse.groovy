package com.armedialab.restful.dto

class ServerResponse {
	/**
	 * Whether the response is a success
	 */
	private boolean isSuccess;

	/**
	 * HTTP Response Code from Server
	 */
	private String responseCode;

	/**
	 * Request Type of the request that was sent to the server
	 */
	private String requestType;

	/**
	 * Error details in case the isSuccess was false
	 */
	private String errorDetails;

	public boolean isSuccess() {
		return isSuccess;
	}

	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

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

	public String getErrorDetails() {
		return errorDetails;
	}

	public void setErrorDetails(String errorDetails) {
		this.errorDetails = errorDetails;
	}

}
