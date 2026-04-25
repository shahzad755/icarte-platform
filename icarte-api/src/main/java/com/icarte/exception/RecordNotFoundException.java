package com.icarte.exception;

public class RecordNotFoundException extends RuntimeException {

	public RecordNotFoundException(Exception ex) {
		super(ex);
	}
	
	public RecordNotFoundException(String exception) {
		super(exception);
	}
}
