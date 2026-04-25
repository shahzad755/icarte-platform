package com.icarte.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icarte.exception.RecordNotFoundException;

@Repository
public abstract class BaseDAO<T> implements IDAO<T> {

	/**
	 * Logger.
	 */
	private static final Log logger = LogFactory.getLog(BaseDAO.class);

	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public T findById(Class<T> clazz, Serializable id) {
		Object data = getCurrentSession().get(clazz, id);
		if(null != data){
			return (T)data;
		}else{
			throw new RecordNotFoundException("No Object found");	
		}
		 
	}

	@SuppressWarnings("unchecked")
	public T findByIdAndLock(Class<T> clazz, Serializable id) {
		return (T) getCurrentSession().get(clazz, id, LockMode.UPGRADE);
	}

	@SuppressWarnings("unchecked")
	public T findObjectByNamedQueryAndLock(final String queryName) {
		Query query = getCurrentSession().getNamedQuery(queryName).setLockMode(
				"", LockMode.UPGRADE);
		List<T> data = query.list();
		if (null != data && data.size() > 0)
			return data.get(0);
		return null;
	}
	@SuppressWarnings("unchecked")
	public T findObjectByNamedQueryAndLock(final String queryName,
			final String[] paramNames, final Object[] paramValues) {

		Query query = populatedNamedParams(queryName, paramNames, paramValues);
		query.setLockMode("", LockMode.UPGRADE);
		List<T> data = query.list();
		if (null != data && data.size() > 0)
			return data.get(0);
		return null;
	}

	@SuppressWarnings("unchecked")
	public T findByIdAndLockNoWait(Class<T> clazz, Serializable id) {
		return (T) getCurrentSession().get(clazz, id, LockMode.UPGRADE);
	}

	@SuppressWarnings("unchecked")
	public List findByNamedQuery(String queryName) {
		Query query = getCurrentSession().getNamedQuery(queryName);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	public List findByQuery(String query) {
		return getCurrentSession().createQuery(query).list();
	}

	@SuppressWarnings("unchecked")
	public List findByQuery(String queryName, Object[] paramValues) {
		Query query = populatedParams(queryName, paramValues);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	public List findByNamedQuery(String queryName, String[] paramNames,
			Object[] paramValues) {
		Query query = populatedNamedParams(queryName, paramNames, paramValues);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	public Object findObjectByNamedQuery(final String queryName) {
		List data = getCurrentSession().getNamedQuery(queryName).list();
		if (null != data && data.size() > 0)
			return data.get(0);
		return null;
	}

	@SuppressWarnings("unchecked")
	public T findObjectByNamedQuery(final String queryName,
			final String[] paramNames, final Object[] paramValues){
		Query query = populatedNamedParams(queryName, paramNames, paramValues);
		List<T> data = query.list();
		
		if (null != data && data.size() > 0){
			return data.get(0);
		}else{
			throw new RecordNotFoundException("No Object found");
		}
	}

	@SuppressWarnings("unchecked")
	public T getReference(Class<T> clazz, Serializable id) {
		return (T) getCurrentSession().load(clazz, id);
	}

	/**
	 * Makes an entity instance managed and persistent.
	 * 
	 * @param o
	 */
	@SuppressWarnings("unchecked")
	public void persist(Object o) {
		getCurrentSession().saveOrUpdate(o);
	}

	/**
	 * Removes a persistent instance from the datastore.
	 * 
	 * @param o
	 */
	public void delete(Object o) {
		getCurrentSession().delete(o);
	}

	/**
	 * Removes all the persistent instances in the collection from the
	 * datastore.
	 * 
	 * @param c
	 *            - the Collection containing the entities to delete
	 */
	public void deleteAll(Collection c) {
		for (Object object : c) {
			getCurrentSession().delete(object);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(final Class<T> entity) {
		return getCurrentSession().createQuery("from " + entity).list();
	}

	/**
	 * Force this session to flush.
	 */
	public void flush() {
		getCurrentSession().flush();
	}

	public void persistAll(final Collection objects) {
		for (Object object : objects) {
			getCurrentSession().saveOrUpdate(object);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> findAllActive(final Class<T> entity, final String orderBy) {
		StringBuilder query = new StringBuilder("from ").append(entity).append(
				" where isActive=1");
		return getCurrentSession().createQuery(query.toString()).list();
	}

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	private Query populatedNamedParams(String queryName, String[] params,
			Object[] values) {
		Query query = getCurrentSession().getNamedQuery(queryName);
		int counter = 0;
		for (String param : params) {
			applyNamedParameterToQuery(query, param, values[counter++]);
		}
		return query;
	}

	private Query populatedParams(String queryName, Object[] paramValues) {
		Query query = getCurrentSession().getNamedQuery(queryName);
		int counter = 0;
		for (Object param : paramValues) {
			query.setParameter(counter++, param);
		}
		return query;
	}

	private void applyNamedParameterToQuery(Query queryObject,
			final String paramName, final Object value)
			throws HibernateException {
		if (value instanceof Collection) {
			queryObject.setParameterList(paramName, (Collection) value);
		} else if (value instanceof Object[]) {
			queryObject.setParameterList(paramName, (Object[]) value);
		} else {
			queryObject.setParameter(paramName, value);
		}
	}

}
