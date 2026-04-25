package com.icarte.commons.marshler;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;
//
//import com.google.gson.ExclusionStrategy;
//import com.google.gson.FieldAttributes;
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//import com.icarte.domain.Menu;

@Component
public class JsonMarshaller /*implements ObjectMarshaller*/ {

	
//	private Gson gsonMarshaller ;		
//	
//	private ExclusionStrategy exclusionStrategy = new ExclusionStrategy() {
//		
//		public boolean shouldSkipField(FieldAttributes fieldAttribute) {
////			return fieldAttribute.getName().equals("handler");
//			return false;
//		}
//		
//		public boolean shouldSkipClass(Class<?> clazz) {
//			return false;
//			//			return clazz == List.class || clazz == Set.class;
//		}
//	};
//	
//	public String marshalList(List data) {
//		GsonBuilder gsonBuilder = new GsonBuilder();
//		gsonBuilder.disableHtmlEscaping();
//		gsonBuilder.setPrettyPrinting();
//		gsonBuilder.setExclusionStrategies(exclusionStrategy);
//		
//		gsonMarshaller = gsonBuilder.create();
//		
//		return gsonMarshaller.toJson(data);
//		
//	}
//	
//	public String marshalObject(Object obj) {
//		GsonBuilder gsonBuilder = new GsonBuilder();
//		gsonBuilder.disableHtmlEscaping();
//		gsonBuilder.setExclusionStrategies(exclusionStrategy);
//		gsonMarshaller = gsonBuilder.create();
//		return gsonMarshaller.toJson(obj);
//	}

}
