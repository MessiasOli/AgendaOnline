package org.AgendaOnline.repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.AgendaOnline.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void register(User user) {
		manager.persist(user);
	}
	
	public boolean userAuthentic (User user) {
		Query query = manager.createQuery("Select u From User u Where u.email = ?1 and u.password = ?2");
		query.setParameter(1, user.getEmail()).setParameter(2, user.getPassword());
	
		try {
			query.getSingleResult();
			return true;
		}catch(NoResultException e) {
			return false;
		}
	}
}
