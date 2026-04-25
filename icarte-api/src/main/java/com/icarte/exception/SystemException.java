package com.icarte.exception;

public class SystemException extends RuntimeException{

	public SystemException(String msg){
		super(msg);
	}
	public SystemException(Exception exception){
		super(exception);
	}
}
