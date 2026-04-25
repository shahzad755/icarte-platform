package com.icarte.module.item.service;

import java.util.List;

import com.icarte.domain.Item;
import com.icarte.domain.ObjectJson;
import com.icarte.dto.ItemDTO;
import com.icarte.dto.ItemResponseDTO;

public interface ItemManagementService {

	ItemResponseDTO findItemsByItemCategory(Long categoryId);
	
	Item fetchItemDetails(Long itemId);
	
	String jsonifyItems(Long categoryId , Long restaurantId);
	
	ObjectJson findItemJson(Long categoryId, Long language, Long version);
}
