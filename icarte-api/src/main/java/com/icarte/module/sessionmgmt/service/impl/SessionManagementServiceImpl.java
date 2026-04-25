package com.icarte.module.sessionmgmt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icarte.domain.Users;
import com.icarte.exception.InvalidLoginDetailsException;
import com.icarte.exception.RecordNotFoundException;
import com.icarte.module.sessionmgmt.SessionBean;
import com.icarte.module.sessionmgmt.UserLoginBean;
import com.icarte.module.sessionmgmt.service.SessionManagementService;
import com.icarte.module.usermgmt.dao.UserManagementDAO;

import static com.icarte.commons.Constants.NamedQueries.*;

@Service
public class SessionManagementServiceImpl implements SessionManagementService {

	@Autowired
	private UserManagementDAO userDao;

	@Value("${login.invalid.credentials}")
	private String invalidCredentialsError;

	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public SessionBean invalidateSession(SessionBean sessionBean) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public SessionBean loginDevice(UserLoginBean loginBean) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * {@inheritDoc}
	 */
	@Transactional
	public SessionBean loginUser(UserLoginBean loginBean) {
		SessionBean sessionBean = new SessionBean();
		try {
			Users user = (Users) userDao.findObjectByNamedQuery(
					FIND_USER_BY_LOGIN, new String[] { "username" },
					new Object[] { loginBean.getUserName() });

			if (loginBean.getPassword().equals(user.getPassword())) {
				sessionBean.setLogedinUser(user);
			} else {
				throw new InvalidLoginDetailsException(invalidCredentialsError);
			}
		} catch (RecordNotFoundException rnfEx) {
			throw new InvalidLoginDetailsException(invalidCredentialsError);
		}

		return null;
	}

}
