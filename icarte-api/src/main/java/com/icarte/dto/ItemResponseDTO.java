package com.icarte.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ItemResponseDTO implements Serializable{
		private List<ItemDTO> items = new ArrayList<ItemDTO>();
		private Long categoryId;
		public List<ItemDTO> getItems() {
			return items;
		}
		public void setItems(List<ItemDTO> items) {
			this.items = items;
		}
		public Long getCategoryId() {
			return categoryId;
		}
		public void setCategoryId(Long categoryId) {
			this.categoryId = categoryId;
		}


}
