package com.icarte.module.category.dao.impl;

import org.springframework.stereotype.Repository;

import com.icarte.dao.BaseDAO;
import com.icarte.domain.ItemCategory;
import com.icarte.module.category.dao.CategoryManagementDAO;

@Repository
public class CategoryManagementDAOImpl extends BaseDAO<ItemCategory> implements
		CategoryManagementDAO {
}
