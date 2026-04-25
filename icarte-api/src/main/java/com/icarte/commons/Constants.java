package com.icarte.commons;

public class Constants {

	public enum ApplicationViews{
		ADMIN_HOME("admin_home");
		
		private String viewName;
		ApplicationViews(String viewName){
			this.viewName = viewName;
		}
		
		public String getViewName(){
			return viewName;
		}
		
	}
	
	
	public static class NamedQueries {
		public static final String FIND_CATEGORIES_BY_MENU_ID = "FIND_CATEGORIES_BY_MENU_ID";
		public static final String FIND_MENU_BY_REST_ID = "FIND_MENU_BY_REST_ID";
		public static final String FIND_USER_BY_LOGIN = "FIND_USER_BY_LOGIN";
		public static final String FIND_ITEMS_BY_CATEGORY = "FIND_ITEMS_BY_CATEGORY";
		public static final String FIND_CATEGORIES_TRANS_BY_MENU_ID = "FIND_CATEGORIES_TRANS_BY_MENU_ID";	
		public static final String FIND_JSON_BY_PARENT_AND_LANG = "FIND_JSON_BY_PARENT_AND_LANG";
		public static final String FIND_ITEM_TRANS_BY_CATEGORY_ID = "FIND_ITEM_TRANS_BY_CATEGORY_ID";	
		public static final String FIND_SPECIAL_DEAL_TRANS_BY_LANG= "FIND_SPECIAL_DEAL_TRANS_BY_LANG";	
		public static final String FIND_SPECIAL_DEAL_BY_REST_ID= "FIND_SPECIAL_DEAL_BY_REST_ID";	

	}
	
	public enum JsonObjectType{
		MENU(1L),
		ITEM_CATEGORY(2L),
		ITEM(3L),
		ORDER(4L);
		JsonObjectType(Long objectType){
			this.objectType = objectType;
		}
		
		private Long objectType;
		
		public Long getObjectType(){
			return objectType;
		}
	}
	
	public enum SequenceHolderEnum{
	
		ORDER_REFERENCE(1L,"ORDER","ORDER_REFERENCE");
	
		private String seqName;
		private String seqHolder;
		private Long seqType;
		
		SequenceHolderEnum(Long seqType , String seqName, String seqHolder){
			this.seqHolder = seqHolder;
			this.seqName = seqName;
			this.seqType = seqType;
		}
		
		public Long getSeqType(){
			return this.seqType;
		}

		public String getSeqHolder(){
			return this.seqHolder;
		}

		public String getSeqName(){
			return this.seqName;
		}
	}
	
}
