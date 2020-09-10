package org.AgendaOnline.model.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.AgendaOnline.model.Contact;
import org.AgendaOnline.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class ContactRepository {

	@PersistenceContext
	EntityManager manager;
	
	public void insertContact(Contact contact) {
		manager.persist(contact);
	}
	
	public List<Contact> listContacts(User user) {
		TypedQuery<Contact> query = manager.createQuery("Select c from Contact c Where c.user = " + user.getId(), Contact.class);
		return query.getResultList();
	}
	
	public void delete(Contact contact) {
		manager.remove(contact);
	}
	
	public Contact find(int id) {
		return manager.find(Contact.class, id);
	}
}
