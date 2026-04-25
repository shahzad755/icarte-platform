package com.icarte.module.specialdeal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icarte.domain.SpecialDealTranslation;
import com.icarte.module.specialdeal.dao.SpecialDealTranslationDAO;
import com.icarte.module.specialdeal.service.SpecialDealTranslationMgmtService;
import static com.icarte.commons.Constants.NamedQueries.*;

@Service
public class SpecialDealTranslationServiceImpl implements
		SpecialDealTranslationMgmtService {

	@Autowired
	private SpecialDealTranslationDAO specialDealTransDAO;

	public List<SpecialDealTranslation> findDealsByLang(Long dealId,
			Long languageId) {

		List<SpecialDealTranslation> specialDeals = specialDealTransDAO
				.findByNamedQuery(FIND_SPECIAL_DEAL_TRANS_BY_LANG,
						new String[] { "langId", "specialDealId" },
						new Object[] { languageId, dealId });

		return specialDeals;
	}
}
