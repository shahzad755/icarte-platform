package com.icarte.module.usermgmt.dao.impl;

import org.springframework.stereotype.Repository;

import com.icarte.dao.BaseDAO;
import com.icarte.domain.Users;
import com.icarte.module.usermgmt.dao.UserManagementDAO;

@Repository
public class UserManagementDAOImpl extends BaseDAO<Users> implements
		UserManagementDAO {

}
