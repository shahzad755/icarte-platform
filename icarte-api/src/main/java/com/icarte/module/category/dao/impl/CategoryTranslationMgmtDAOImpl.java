package com.icarte.module.category.dao.impl;

import org.springframework.stereotype.Repository;

import com.icarte.dao.BaseDAO;
import com.icarte.dao.IDAO;
import com.icarte.domain.ItemCategoryTranslation;
import com.icarte.module.category.dao.CategoryTranslationMgmtDAO;

@Repository
public class CategoryTranslationMgmtDAOImpl extends
		BaseDAO<ItemCategoryTranslation> implements CategoryTranslationMgmtDAO {

}
