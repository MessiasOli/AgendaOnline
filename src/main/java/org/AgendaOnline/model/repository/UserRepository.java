package org.AgendaOnline.model.repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.AgendaOnline.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void register(User user){
		manager.persist(user);
	}
	
	public User userAuthentic (User user) {
		Query query = manager.createQuery("Select u From User u Where u.email = ?1 and u.password = ?2");
		query.setParameter(1, user.getEmail()).setParameter(2, user.getPassword());
	
		try {
			return (User)query.getSingleResult();
		}catch(NoResultException e) {
			return null;
		}
	}
	
	public User find(Integer id) {
		return manager.find(User.class, id);
	}
	
	public User findByEmail(String email) {
		Query query = manager.createQuery("Select u From User u Where u.email = ?1");
		query.setParameter(1, email);
	
		try { 
			 return (User)query.getSingleResult();
		}catch(NoResultException e) {
			return null;
		}
	}
}
