package com.icarte.exception;

public class InvalidLoginDetailsException extends RuntimeException {

	public InvalidLoginDetailsException(String exception) {
		super(exception);
	}
}
