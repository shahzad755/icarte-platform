package com.armedialab.util;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

public class Constants {

	public static Long DEFAULT_VARIANT_TYPE_ID = 1L;
	public static final String REGULAR_VARIANT = "Regular";
	public static final String KEY_RESTAURANT = "_RESTAURANT";
	public static final String KEY_DEVICE_INFO = "_DEVICE_INFO";
	public static final String KEY_BRANCH = "_BRANCH";
	
    public enum RequestCode {
        REGISTER_DEVICE("register_device"),
        VERIFY_DEVICE("verify_device"),
        LOAD_ITEMS("load_items"),
        SUBMIT_ORDER("submit_order"),
        SUBMIT_FEEDBACK("submit_feedback"),
        CALL_WAITER("call_waiter"),
        LOGIN("login_request");

        private String requestCode;

        RequestCode(String requestCode) {
            this.requestCode = requestCode;
        }

        public String getRequestCode() {
            return requestCode;
        }
    }


	
	public enum Languages {

		ENGLISH(1L), ARABIC(2L);

		/** The Constant LOOKUP. */
		private static final Map<Long, Languages> LOOKUP = new HashMap<Long, Languages>();

		static {
			for (Languages LanguagesConst : EnumSet.allOf(Languages.class)) {
				LOOKUP.put(LanguagesConst.getLanguagesId(), LanguagesConst);
			}
		}

		Long LanguagesId;

		private Languages(Long Languages) {
			this.LanguagesId = Languages;
		}

		public Long getLanguagesId() {
			return this.LanguagesId;
		}

		public void setLanguagesId(Long LanguagesId) {
			this.LanguagesId = LanguagesId;
		}

		public static Languages getLanguagesConstant(Long code) {
			Languages LanguagesConst = null;
			if (code != null) {
				if (LOOKUP.containsKey(code)) {
					LanguagesConst = LOOKUP.get(code);
				}
			}
			return LanguagesConst;
		}
	}

	public enum StatusTypeEnum {

		NEW(1L), 
		APPROVED(2L), 
		IN_PROGRESS(3L), 
		CANCELLED(4L), 
		PREPARED(5L), 
		VOID(6L), 
		PAID(7L),
		REQUESTED(8L),
		ACTIONED(9L);

		/** The Constant LOOKUP. */
		private static final Map<Long, StatusTypeEnum> LOOKUP = new HashMap<Long, StatusTypeEnum>();

		static {
			for (StatusTypeEnum StatusTypeConst : EnumSet.allOf(StatusTypeEnum.class)) {
				LOOKUP.put(StatusTypeConst.getStatusTypeId(), StatusTypeConst);
			}
		}

		Long statusTypeId;

		private StatusTypeEnum(Long statusTypeId) {
			this.statusTypeId = statusTypeId;
		}

		public Long getStatusTypeId() {
			return this.statusTypeId;
		}

		public void setStatusTypeId(Long statusTypeId) {
			this.statusTypeId = statusTypeId;
		}

		public static StatusTypeEnum getStatusTypeIdConstant(Long code) {
			StatusTypeEnum StatusTypeConst = null;
			if (code != null) {
				if (LOOKUP.containsKey(code)) {
					StatusTypeConst = LOOKUP.get(code);
				}
			}
			return StatusTypeConst;
		}
	}
	
}
