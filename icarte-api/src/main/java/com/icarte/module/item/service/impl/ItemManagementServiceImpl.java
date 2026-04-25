package com.icarte.module.item.service.impl;

import static com.icarte.commons.Constants.NamedQueries.FIND_ITEMS_BY_CATEGORY;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.Constants.JsonObjectType;
import com.icarte.commons.ObjectTransformer;
import com.icarte.domain.Item;
import com.icarte.domain.ItemCategory;
import com.icarte.domain.ObjectJson;
import com.icarte.domain.Resturant;
import com.icarte.dto.ItemDTO;
import com.icarte.dto.ItemResponseDTO;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.item.dao.ItemManagementDAO;
import com.icarte.module.item.dao.ItemTranslationMgmtDAO;
import com.icarte.module.item.service.ItemManagementService;
import com.icarte.module.menu.service.JsonManagementService;
import com.icarte.module.restaurant.service.RestaurantMgmtService;

@Service
public class ItemManagementServiceImpl implements ItemManagementService {

	@Value("${message.norecordfound}")
	private String noRecordFoundMsg;

	@Autowired
	private ItemManagementDAO itemDAO;

	@Autowired
	private ItemTranslationMgmtDAO itemTranslationDAO;

	@Autowired
	private RestaurantMgmtService restaurantService;

	@Autowired
	private JsonManagementService jsonService;

	@Transactional
	public ItemResponseDTO findItemsByItemCategory(Long itemCategory) {

		
		List<Item> items = itemDAO.findByNamedQuery(FIND_ITEMS_BY_CATEGORY,
				new String[] { "categoryId" },
				new Object[] { itemCategory });

		List<ItemDTO> itemDTOList = new ArrayList<ItemDTO>();
		if (null != items && !items.isEmpty()) {
			for (Item item : items) {
				itemDTOList.add(ObjectTransformer.itemToDto(item));
			}
		} else {
			throw new RecordNotFoundException(noRecordFoundMsg);
		}

		
		ItemResponseDTO itemResponseDTO = new ItemResponseDTO();
		itemResponseDTO.setItems(itemDTOList);
		itemResponseDTO.setCategoryId(itemCategory);
		return itemResponseDTO;

	}

	@Transactional
	public Item fetchItemDetails(Long itemId) {
		try {
			Item itemDetails = itemDAO.findById(Item.class, itemId);
			return itemDetails;
		} catch (RecordNotFoundException rnfEx) {
			throw new RecordNotFoundException(noRecordFoundMsg);
		}
	}

	@Transactional
	public String jsonifyItems(Long categoryId, Long restaurantId) {
		String jsonData = "";
		try {

			List<Item> items = itemDAO.findByNamedQuery(FIND_ITEMS_BY_CATEGORY,
					new String[] { "categoryId" }, new Object[] { categoryId });

			List<ItemDTO> itemDtoList = new ArrayList<ItemDTO>();

			for (Item item : items) {
				itemDtoList.add(ObjectTransformer.itemToDto(item));
			}

			Resturant restaurant = restaurantService.findById(1L);

			jsonData = jsonService.jsonifyData(restaurant, itemDtoList,
					categoryId, 1L, JsonObjectType.ITEM);

			System.out.println(jsonData);

		} catch (RecordNotFoundException rnfEx) {
			rnfEx.printStackTrace();
		}

		return jsonData;
	}

	public ObjectJson findItemJson(Long categoryId, Long language, Long version) {
		return jsonService.findJSON(categoryId, JsonObjectType.ITEM, language,
				version);
	}

}
