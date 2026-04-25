package com.icarte.commons;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.icarte.domain.AccountType;
import com.icarte.domain.AddonTranslation;
import com.icarte.domain.Branch;
import com.icarte.domain.CuisineTranslation;
import com.icarte.domain.CuisineType;
import com.icarte.domain.IngredientTranslation;
import com.icarte.domain.Item;
import com.icarte.domain.ItemAddon;
import com.icarte.domain.ItemCategory;
import com.icarte.domain.ItemCategoryTranslation;
import com.icarte.domain.ItemIngredient;
import com.icarte.domain.ItemMediaContent;
import com.icarte.domain.ItemTranslation;
import com.icarte.domain.ItemVariant;
import com.icarte.domain.Menu;
import com.icarte.domain.Orders;
import com.icarte.domain.Resturant;
import com.icarte.domain.ServingTable;
import com.icarte.domain.SpecialDeal;
import com.icarte.domain.SpecialDealItem;
import com.icarte.domain.SpecialDealTranslation;
import com.icarte.domain.SpiceType;
import com.icarte.domain.SpiceTypeTranslation;
import com.icarte.domain.Variant;
import com.icarte.domain.VariantTranslation;
import com.icarte.dto.AccountTypeDTO;
import com.icarte.dto.BranchDTO;
import com.icarte.dto.CuisineTypeDTO;
import com.icarte.dto.ItemAddonDTO;
import com.icarte.dto.ItemCategoryDTO;
import com.icarte.dto.ItemDTO;
import com.icarte.dto.ItemIngredientDTO;
import com.icarte.dto.ItemVariantDTO;
import com.icarte.dto.MediaContentDTO;
import com.icarte.dto.MenuDTO;
import com.icarte.dto.OrderDTO;
import com.icarte.dto.OrderItemDTO;
import com.icarte.dto.RestaurantDTO;
import com.icarte.dto.ServingTableDTO;
import com.icarte.dto.SpecialDealDTO;
import com.icarte.dto.SpecialDealItemDTO;
import com.icarte.dto.SpiceTypeDTO;
import com.icarte.dto.TranslationDTO;

public class ObjectTransformer {

	public static RestaurantDTO restaurantToDto(Resturant restaurant) {

		RestaurantDTO dto = new RestaurantDTO();
		dto.setActivationKey(restaurant.getActivationKey());
		dto.setBackgroundImage(restaurant.getBackgroundImage());
		dto.setContactPerson(restaurant.getContactPerson());
		dto.setLogoLarge(restaurant.getLogoLarge());
		dto.setLogoSmall(restaurant.getLogoSmall());
		dto.setResturantId(restaurant.getResturantId());
		dto.setTheme(restaurant.getTheme());
		dto.setAccountTypeDTO(accountTypeToDto(restaurant.getAccountType()));

		return dto;
	}

	public static AccountTypeDTO accountTypeToDto(AccountType accountType) {
		AccountTypeDTO dto = new AccountTypeDTO();
		dto.setAccountName(accountType.getAccountName());
		dto.setAccountTypeId(accountType.getAccountTypeId());
		dto.setDescription(accountType.getDescription());
		return dto;
	}

	public static MenuDTO menuToDto(Menu menu) {
		MenuDTO dto = new MenuDTO();
		dto.setMenuId(menu.getMenuId());
		dto.setName(menu.getTitle());
		return dto;
	}

	public static ItemCategoryDTO categoryToDto(ItemCategory category) {
		ItemCategoryDTO dto = new ItemCategoryDTO();
		dto.setAvailableDurationEnd(category.getAvailableDurationEnd());
		dto.setAvailableDurationStart(category.getAvailableDurationStart());
		dto.setImageUrl(category.getImageUrl());
		dto.setItemCategoryId(category.getItemCategoryId());
		dto.setLargeIconUrl(category.getLargeIconUrl());
		dto.setSmallIconUrl(category.getSmallIconUrl());
		dto.setTags(category.getTags());
		dto.setPriority(category.getPriority());
		Set<ItemCategoryTranslation> categoryTranslations = category
				.getItemCategoryTranslations();
		Map<String, TranslationDTO> itemCateTran = new HashMap<String, TranslationDTO>();
		for (ItemCategoryTranslation itemCategoryTranslation : categoryTranslations) {
			itemCateTran.put(itemCategoryTranslation.getRefLanguages()
					.getCode(), categoryTransToDto(itemCategoryTranslation));
		}
		dto.setTranslations(itemCateTran);
		return dto;
	}

	public static TranslationDTO categoryTransToDto(
			ItemCategoryTranslation categoryTrans) {
		TranslationDTO transDTO = new TranslationDTO();
		transDTO.setDescription(categoryTrans.getDescription());
		transDTO.setLanguageId(categoryTrans.getRefLanguages().getLanguageId());
		transDTO.setTitle(categoryTrans.getTitle());
		transDTO.setTranslationId(categoryTrans.getItemCategoryTransId());
		return transDTO;
	}

	public static TranslationDTO ItemTransToDto(ItemTranslation itemTrans) {
		TranslationDTO dto = new TranslationDTO();
		dto.setDescription(itemTrans.getDescription());
		dto.setLanguageId(itemTrans.getRefLanguages().getLanguageId());
		dto.setTitle(itemTrans.getTitle());
		dto.setTranslationId(itemTrans.getItemTranslationId());
		return dto;
	}

	public static TranslationDTO SpiceTypeTransToDto(
			SpiceTypeTranslation itemTrans) {
		TranslationDTO dto = new TranslationDTO();
		dto.setDescription(itemTrans.getDescription());
		dto.setLanguageId(itemTrans.getRefLanguages().getLanguageId());
		dto.setTitle(itemTrans.getTitle());
		dto.setTranslationId(itemTrans.getSpiceTypeTransId());
		return dto;
	}

	
	public static List<ItemVariantDTO> transformItemVariantsToDTO(Set <ItemVariant> itemVariants){
		List<ItemVariantDTO> variantDTOs = new ArrayList<ItemVariantDTO>();

		ItemVariantDTO itemVariantDto = null;
		
		for (ItemVariant itemVariant : itemVariants) {
			itemVariantDto = new ItemVariantDTO();
			itemVariantDto.setApproxPreperationTime(itemVariant.getApproxPreperationTime());
			itemVariantDto.setItemVariantId(itemVariant.getItemVariantId());
			itemVariantDto.setPrice(itemVariant.getPrice());
			itemVariantDto.setTranslations(variantTranslationToDTO(itemVariant.getVariant()));
			variantDTOs.add(itemVariantDto);
		}	
		
		return variantDTOs;
	}

	public static Map<String, TranslationDTO> variantTranslationToDTO(Variant variant){
		Set<VariantTranslation> translations = variant.getVariantTranslations();
		TranslationDTO dto = null;
		Map<String ,TranslationDTO> variantTranslations = new HashMap<String, TranslationDTO>();
 		for (VariantTranslation variantTranslation : translations) {
			dto = new TranslationDTO();
			dto.setDescription(variantTranslation.getDescription());
			dto.setLanguageId(variantTranslation.getRefLanguages().getLanguageId());
			dto.setTitle(variantTranslation.getTitle());
			dto.setTranslationId(variantTranslation.getVariantTransId());
			variantTranslations.put(variantTranslation.getRefLanguages().getCode(), dto);
		}
 		return variantTranslations;
	}
	
	
	public static ItemDTO itemToDto(Item item) {
		ItemDTO dto = new ItemDTO();
		dto.setItemId(item.getItemId());
		dto.setPrice(item.getPrice());
		dto.setTags(item.getTags());
		dto.setCategoryId(item.getItemCategory().getItemCategoryId());
		dto.setCusineType(cuisineTypeToDto(item.getCuisineType()));
		dto.setSpiceType(spiceTypeToDto(item.getSpiceType()));
		
		for (ItemMediaContent mediaContent : item.getItemMediaContents()) {
			dto.getMediaContents().add(mediaContentTypeToDto(mediaContent));
		}

		for (ItemIngredient itemIngrediant : item.getItemIngredients()) {
			dto.getItemIngrediants().add(itemIngerdientToDto(itemIngrediant));
		}

		Set<ItemTranslation> itemTranslations = item.getItemTranslations();
		Map<String, TranslationDTO> itemTransMap = new HashMap<String, TranslationDTO>();

		for (ItemTranslation itemTranslation : itemTranslations) {
			itemTransMap.put(itemTranslation.getRefLanguages().getCode(),
					ItemTransToDto(itemTranslation));
		}
		dto.setTranslations(itemTransMap);
		dto.setItemVariants(transformItemVariantsToDTO(item.getItemVariants()));
		
		Set<ItemAddon> itemAddons = item.getItemAddons();
		for (ItemAddon itemAddon : itemAddons) {
			dto.getAddons().add(transformItemAddonToDTO(itemAddon));
		}
		
		return dto;
	}

	public static SpiceTypeDTO spiceTypeToDto(SpiceType spiceType) {
		SpiceTypeDTO dto = new SpiceTypeDTO();
		dto.setImageUrl(spiceType.getImageUrl());
		
		dto.setSpiceTypeId(spiceType.getSpiceTypeId());

		Map<String, TranslationDTO> itemTransMap = new HashMap<String, TranslationDTO>();

		for (SpiceTypeTranslation spiceTypeTranslation : spiceType
				.getSpiceTypeTranslations()) {
			itemTransMap.put(spiceTypeTranslation.getRefLanguages().getCode(),
					SpiceTypeTransToDto(spiceTypeTranslation));

		}
		dto.setTranslations(itemTransMap);

		return dto;

	}

	public static CuisineTypeDTO cuisineTypeToDto(CuisineType cuisineType) {
		CuisineTypeDTO dto = new CuisineTypeDTO();
		dto.setCuisineTypeId(cuisineType.getCuisineTypeId());
		dto.setImageUrl(cuisineType.getImageUrl());

		Map<String, TranslationDTO> cuisineTransMap = new HashMap<String, TranslationDTO>();

		for (CuisineTranslation cuisineTrans : cuisineType
				.getCuisineTranslations()) {
			cuisineTransMap.put(cuisineTrans.getRefLanguages().getCode(),
					cuisineTypeTransToDto(cuisineTrans));

		}
		dto.setTranslations(cuisineTransMap);

		return dto;

	}
	
	

	public static TranslationDTO cuisineTypeTransToDto(
			CuisineTranslation cusineTrans) {
		TranslationDTO dto = new TranslationDTO();
		dto.setDescription(cusineTrans.getDescription());
		dto.setLanguageId(cusineTrans.getRefLanguages().getLanguageId());
		dto.setTitle(cusineTrans.getTitle());
		dto.setTranslationId(cusineTrans.getCuisineTransId());
		return dto;
	}

	public static MediaContentDTO mediaContentTypeToDto(ItemMediaContent content) {
		MediaContentDTO dto = new MediaContentDTO();
		dto.setDisplayOrder(content.getDisplayOrder());
		dto.setImageUrl(content.getImageUrl());
		dto.setItemMediaId(content.getItemMediaId());
		dto.setVedioUrl(content.getVedioUrl());
		return dto;

	}

	public static ItemIngredientDTO itemIngerdientToDto(
			ItemIngredient itemIngrediant) {
		ItemIngredientDTO dto = new ItemIngredientDTO();
		dto.setImageUrl(itemIngrediant.getIngredients().getImageUrl());
		dto.setIngredientId(itemIngrediant.getIngredients().getIngredientId());
		Map<String, TranslationDTO> translations = new HashMap<String, TranslationDTO>();

		for (IngredientTranslation ingridientTrans : itemIngrediant
				.getIngredients().getIngredientTranslations()) {
			translations.put(ingridientTrans.getRefLanguages().getCode(),
					ingridientTransToDto(ingridientTrans));

		}
		dto.setTranslations(translations);

		return dto;
	}

	public static TranslationDTO ingridientTransToDto(
			IngredientTranslation ingridientTrans) {
		TranslationDTO dto = new TranslationDTO();
		dto.setDescription(ingridientTrans.getDescription());
		dto.setLanguageId(ingridientTrans.getRefLanguages().getLanguageId());
		dto.setTitle(ingridientTrans.getTitle());
		dto.setTranslationId(ingridientTrans.getIngredientTransId());
		return dto;
	}
	
	

	public static SpecialDealDTO specialDealToDto(SpecialDeal specialDeal) {
		SpecialDealDTO dto = new SpecialDealDTO();
		dto.setEndDate(specialDeal.getEndDate());
		dto.setImageUrl(specialDeal.getImageUrl());
		dto.setIsActive(specialDeal.getIsActive());
		dto.setPrice(specialDeal.getPrice());
		dto.setSpecialDealId(specialDeal.getSpecialDealId());
		dto.setStartDate(specialDeal.getStartDate());
		Set<SpecialDealTranslation> specialDealTranslations = specialDeal.getSpecialDealTranslations();
		Map<String,TranslationDTO> specialDealTranMap = new HashMap<String,TranslationDTO>();
		for (SpecialDealTranslation specialDealTranslation : specialDealTranslations) {
			specialDealTranMap.put(specialDealTranslation.getRefLanguages().getCode(),specialDealTransToDto(specialDealTranslation));
		}
		Set<SpecialDealItem> dealItems = specialDeal.getSpecialDealItems();
		List<SpecialDealItemDTO> itemDTOs = new ArrayList<SpecialDealItemDTO>();
		if(dealItems != null){
			for (SpecialDealItem specialDealItem : dealItems) {
				itemDTOs.add(SpecialDealItemToDto(specialDealItem));
			}
		}
		dto.setSpecialDealItems(itemDTOs);
		dto.setTranslations(specialDealTranMap);
		return dto;
	}

	public static SpecialDealItemDTO SpecialDealItemToDto(SpecialDealItem item) {
		SpecialDealItemDTO dto = new SpecialDealItemDTO();

		dto.setItemDTO(itemToDto(item.getItem()));
		dto.setQuantity(item.getQuantity());
		dto.setSpecialDealItemId(item.getMealDealItemId());
		return dto;
	}

	public static TranslationDTO specialDealTransToDto(
			SpecialDealTranslation specialDealTrans) {
		TranslationDTO transDTO = new TranslationDTO();
		transDTO.setDescription(specialDealTrans.getDescription());
		transDTO.setLanguageId(specialDealTrans.getRefLanguages()
				.getLanguageId());
		transDTO.setTitle(specialDealTrans.getTitle());
		transDTO.setTranslationId(specialDealTrans
				.getSpecialDealTranslationId());
		return transDTO;
	}

	
	
	// ORDER JSON 
	
	public static OrderDTO transformOrderToDto(Orders orders , Item item){
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setCancellationReason(orders.getCancellationReason());
		orderDTO.setOrderDate(orders.getOrderDate());
		orderDTO.setOrderId(orders.getOrderId());
		orderDTO.setOrderStatus(orders.getOrderStatus());
		orderDTO.setReferenceNum(orders.getReferenceNum());
		orderDTO.setSpecialRemarks(orders.getSpecialRemarks());

		orderDTO.setBranch(transformBranchToDTO(orders.getBranch()));
		
		List<OrderItemDTO> orderItems = new ArrayList<OrderItemDTO>();
		orderItems.add(transformOrderItemsToDTO(item));
		
		orderDTO.setOrderItems(orderItems);
		orderDTO.setServingTableDTO(transformServingTableToDTO(orders.getServingTable()));
		
		return orderDTO;
		
	}
	
	public static ServingTableDTO transformServingTableToDTO(ServingTable servingTable){
		ServingTableDTO tableDTO = new ServingTableDTO();
		tableDTO.setDescription(servingTable.getDescription());
		tableDTO.setServingTableId(servingTable.getServingTableId());
		tableDTO.setTableRefNumber(servingTable.getTableRefNumber());
		return tableDTO;
	}
	
	public static OrderItemDTO transformOrderItemsToDTO(Item item){
		OrderItemDTO orderItemDTO = new OrderItemDTO();
		orderItemDTO.setItemId(item.getItemId());
		orderItemDTO.setOrderPrice(item.getPrice());
		orderItemDTO.setQuantity(1L);
		orderItemDTO.setSpecialRemarks("Remarks for Order");
		return orderItemDTO;
	}
	
	public static BranchDTO transformBranchToDTO(Branch branch){
		BranchDTO branchDTO = new BranchDTO();
		branchDTO.setArea(branch.getAddress().getArea());
		branchDTO.setBranchId(branch.getBranchId());
		branchDTO.setCity(branch.getAddress().getCity());
		branchDTO.setCountry(branch.getAddress().getCountry());
		branchDTO.setDescription(branch.getAddress().getDescription());
		branchDTO.setEmail(branch.getAddress().getEmail());
		branchDTO.setLat(branch.getAddress().getLat());
		branchDTO.setLongitude(branch.getAddress().getLongitude());
		branchDTO.setManagerId(branch.getManagerId());
		branchDTO.setPoBox(branch.getAddress().getPoBox());
		branchDTO.setStreet(branch.getAddress().getStreet());
		
		return branchDTO;
	}
	
	
	
	public static ItemAddonDTO transformItemAddonToDTO(ItemAddon itemAddon){
		ItemAddonDTO addonDTO = new ItemAddonDTO();
		addonDTO.setItemAddonId(itemAddon.getItemAddonId());
		addonDTO.setImageUrl(itemAddon.getAddons().getImageUrl());
		addonDTO.setAddonId(itemAddon.getAddons().getAddonId());
		addonDTO.setPrice(itemAddon.getPrice());
		
		Set<AddonTranslation> addonTranslations = itemAddon.getAddons().getAddonTranslations();
		Map<String,TranslationDTO> addonTranMap = new HashMap<String,TranslationDTO>();
		for (AddonTranslation addonTranslation: addonTranslations) {
			addonTranMap.put(addonTranslation.getRefLanguages().getCode(),addonTransToDto(addonTranslation));
		}
		
		addonDTO.setTranslations(addonTranMap);
		
		return addonDTO;
	}
	
	
	public static TranslationDTO addonTransToDto(
			AddonTranslation addonTranslation) {
		TranslationDTO transDTO = new TranslationDTO();
		transDTO.setDescription(addonTranslation.getDescription());
		transDTO.setLanguageId(addonTranslation.getRefLanguages()
				.getLanguageId());
		transDTO.setTitle(addonTranslation.getTitle());
		transDTO.setTranslationId(addonTranslation
				.getAddonTrnaslationId());
		return transDTO;
	}	
	
	
	
	
	
}
