package com.icarte.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

public interface IDAO<T> {
	T findById(Class<T> clazz, Serializable id);

	T findByIdAndLock(Class<T> clazz, Serializable id);

	T findObjectByNamedQueryAndLock(final String queryName);

	T findObjectByNamedQueryAndLock(final String queryName,
			final String[] paramNames, final Object[] paramValues);

	T findByIdAndLockNoWait(Class<T> clazz, Serializable id);

	List<T> findByNamedQuery(String queryName);

	List<T> findByQuery(String query);

	List<T> findByQuery(String query, Object[] paramValues);

	List<T> findByNamedQuery(String queryName, String[] paramNames,
			Object[] paramValues);

	Object findObjectByNamedQuery(final String queryName);

	T findObjectByNamedQuery(final String queryName,
			final String[] paramNames, final Object[] paramValues);

	T getReference(Class<T> clazz, Serializable id);

	void persist(Object o);

	void delete(Object o);

	void deleteAll(Collection c);

	List<T> findAll(final Class<T> entity);

	void flush();

	void persistAll(final Collection objects);

	List<T> findAllActive(final Class<T> entity, final String orderBy);

}
