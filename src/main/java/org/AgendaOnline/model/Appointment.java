package org.AgendaOnline.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.AgendaOnline.dto.AppointmentDto;
import org.springframework.transaction.annotation.Transactional;

@Entity
public class Appointment {

	@Id
	@GeneratedValue
	private int id;
	private String description;
	private String local;
	@Column(name = "date")
	private java.sql.Timestamp date;
	@ManyToOne
	private User user;
	@OneToOne(orphanRemoval=true)
	private Contact contact;
	

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}
	
	@Transient
	private SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public void clone(AppointmentDto appoint) {
		
		this.description = appoint.getDescription();
		this.local = appoint.getLocal();
		
		System.out.println(appoint.getFormatDate());
		try {
			this.date = new Timestamp(DATE_TIME_FORMAT.parse(appoint.getFormatDate() + " " + appoint.getFormatHour() + ":00").getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
