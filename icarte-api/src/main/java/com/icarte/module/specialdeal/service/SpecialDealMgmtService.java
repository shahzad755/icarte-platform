package com.icarte.module.specialdeal.service;

import java.util.List;

import com.icarte.dto.SpecialDealDTO;

//import com.google.gson.JsonObject;


public interface SpecialDealMgmtService {

	

	List<SpecialDealDTO> findSpecialDeals(Long menuId);
//	JsonObject jsonifySpecialDeals(Long resturantId);
}
