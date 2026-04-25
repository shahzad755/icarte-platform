package com.icarte.module.sessionmgmt.service;

import com.icarte.module.sessionmgmt.SessionBean;
import com.icarte.module.sessionmgmt.UserLoginBean;

public interface SessionManagementService {

	SessionBean loginUser(UserLoginBean loginBean);
	
	SessionBean loginDevice(UserLoginBean loginBean);
	
	SessionBean invalidateSession(SessionBean sessionBean);
}
