package com.icarte.module.menu.service.impl;

import static com.icarte.commons.Constants.NamedQueries.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.commons.Constants.JsonObjectType;
import com.icarte.commons.marshler.JsonMarshaller;
import com.icarte.domain.ObjectJson;
import com.icarte.domain.RefLanguages;
import com.icarte.domain.Resturant;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.json.dao.JsonManagmentDAO;
import com.icarte.module.language.dao.LanguageMgmtDAO;
import com.icarte.module.menu.service.JsonManagementService;

@Service
public class JsonManagementServiceImpl implements JsonManagementService {
	@Autowired
	private LanguageMgmtDAO languageMgmtDAO;

	@Autowired
	private JsonManagmentDAO jsonDAO;

	@Autowired
	private JsonMarshaller jsonMarshaller;

	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public String jsonifyData(Resturant restaurant, List data, Long parentId,
			Long langId, JsonObjectType objectType) {
		try {

			ObjectJson jsonData = null;
			RefLanguages lang = languageMgmtDAO.findById(RefLanguages.class,
					langId);
			String jsonString ="";// jsonMarshaller.marshalList(data);
			jsonData = new ObjectJson();
			jsonData.setLanguage(lang);
			jsonData.setParentId(parentId);
			jsonData.setRecordType(objectType.getObjectType());
			jsonData.setRestaurant(restaurant);
			jsonData.setJsonVersion(1L);
			jsonData.setJsonData(jsonString);
			jsonDAO.persist(jsonData);
			System.out.println(jsonString);

		} catch (RecordNotFoundException rnfEx) {
			rnfEx.printStackTrace();
		}
		return "";
	}

	/**
	 * {@inheritDoc}
	 */
	public ObjectJson findJSON(Long parentId, JsonObjectType recordType,
			Long languageId, Long version) {

		try {
			ObjectJson jsonData = jsonDAO.findObjectByNamedQuery(
					FIND_CATEGORIES_TRANS_BY_MENU_ID, new String[] { "langId",
							"parentId", "recordType", "version" },
					new Object[] { languageId, parentId, recordType, version });

			return jsonData;
		} catch (RecordNotFoundException rnfEx) {
			throw new RecordNotFoundException(rnfEx);
		}

	}

	
	
	/**
	 * {@inheritDoc}
	 */
	public ObjectJson findJSON(Long parentId, JsonObjectType recordType) {

		try {
			ObjectJson jsonData = jsonDAO.findObjectByNamedQuery(
					FIND_JSON_BY_PARENT_AND_LANG, new String[] {"parentId", "recordType"},
					new Object[] {parentId, recordType.getObjectType()});

			return jsonData;
		} catch (RecordNotFoundException rnfEx) {
			throw new RecordNotFoundException(rnfEx);
		}

	}
	
	
}
