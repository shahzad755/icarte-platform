package com.icarte.commons;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utilities {

	public static String generateRandomString(){
		return RandomStringUtil.generateRandomToken();
	}


	public static String currentDateAsString(){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String format = formatter.format(date);
		return format.replaceAll("-", "");
	}

}
