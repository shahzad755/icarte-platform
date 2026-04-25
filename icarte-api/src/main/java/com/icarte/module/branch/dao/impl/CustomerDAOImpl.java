package com.icarte.module.branch.dao.impl;

import org.springframework.stereotype.Repository;

import com.icarte.dao.BaseDAO;
import com.icarte.domain.Customer;
import com.icarte.module.branch.dao.CustomerDAO;

@Repository
public class CustomerDAOImpl extends BaseDAO<Customer> implements CustomerDAO{

}
