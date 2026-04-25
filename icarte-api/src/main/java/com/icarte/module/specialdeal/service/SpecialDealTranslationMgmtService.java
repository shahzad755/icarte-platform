package com.icarte.module.specialdeal.service;

import java.util.List;

import com.icarte.domain.SpecialDealTranslation;

public interface SpecialDealTranslationMgmtService {
	
	List<SpecialDealTranslation> findDealsByLang(Long restaurantId , Long languageId);
	
}
