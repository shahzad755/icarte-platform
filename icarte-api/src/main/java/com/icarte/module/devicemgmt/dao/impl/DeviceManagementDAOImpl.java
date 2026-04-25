package com.icarte.module.devicemgmt.dao.impl;

import org.springframework.stereotype.Repository;

import com.icarte.dao.BaseDAO;
import com.icarte.domain.RestaurantDevice;
import com.icarte.module.devicemgmt.dao.DeviceManagementDAO;

@Repository
public class DeviceManagementDAOImpl extends BaseDAO<RestaurantDevice> implements
		DeviceManagementDAO {
}
