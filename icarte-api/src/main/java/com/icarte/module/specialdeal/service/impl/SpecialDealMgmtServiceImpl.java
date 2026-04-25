package com.icarte.module.specialdeal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.ObjectTransformer;
import com.icarte.domain.SpecialDeal;
import com.icarte.dto.SpecialDealDTO;
//import com.google.gson.JsonObject;
import com.icarte.module.specialdeal.dao.SpecialDealDAO;
import com.icarte.module.specialdeal.service.SpecialDealMgmtService;
import com.icarte.module.specialdeal.service.SpecialDealTranslationMgmtService;

import static com.icarte.commons.Constants.NamedQueries.FIND_SPECIAL_DEAL_BY_REST_ID;

@Service
@Transactional
public class SpecialDealMgmtServiceImpl implements SpecialDealMgmtService {

	@Autowired
	private SpecialDealTranslationMgmtService specialDealTransService;

	@Autowired
	private SpecialDealDAO specialDealDao;

	public List<SpecialDealDTO> findSpecialDeals(Long restaurantId) {
		List<SpecialDeal> specialDeals = specialDealDao.findByNamedQuery(
				FIND_SPECIAL_DEAL_BY_REST_ID, new String[] { "restaurantId" },
				new Object[] { restaurantId });
		List<SpecialDealDTO> specialDealDTOList = new ArrayList<SpecialDealDTO>();
		SpecialDealDTO specialDealDTO = null; 
		
		for (SpecialDeal specialDeal : specialDeals) {
			specialDealDTO = ObjectTransformer.specialDealToDto(specialDeal);
			specialDealDTOList.add(specialDealDTO);
			
		}
		
		return specialDealDTOList;
	}

}
