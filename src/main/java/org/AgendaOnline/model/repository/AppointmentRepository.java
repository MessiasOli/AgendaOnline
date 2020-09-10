package org.AgendaOnline.model.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.AgendaOnline.model.Appointment;
import org.AgendaOnline.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class AppointmentRepository {

	@PersistenceContext
	EntityManager manager;
	
	public void insertAppointment(Appointment appointment) {
		manager.persist(appointment);
	}
	
	public List<Appointment> listAppointments(User user) {
		TypedQuery<Appointment> query = manager.createQuery("Select c from Appointment c Where c.user = " + user.getId(), Appointment.class);
		return query.getResultList();
	}
	
	public void delete(Appointment appointment) {
		manager.remove(appointment);
	}
	
	public Appointment find(int id) {
		return manager.find(Appointment.class, id);
	}
}
