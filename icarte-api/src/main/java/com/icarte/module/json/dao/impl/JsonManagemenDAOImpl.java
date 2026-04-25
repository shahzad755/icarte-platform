package com.icarte.module.json.dao.impl;

import org.springframework.stereotype.Repository;

import com.icarte.dao.BaseDAO;
import com.icarte.domain.ObjectJson;
import com.icarte.module.json.dao.JsonManagmentDAO;

@Repository
public class JsonManagemenDAOImpl extends BaseDAO<ObjectJson> implements
		JsonManagmentDAO {

}
