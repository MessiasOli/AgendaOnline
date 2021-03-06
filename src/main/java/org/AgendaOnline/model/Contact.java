package org.AgendaOnline.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.GeneratedValue;

@Entity
public class Contact {
	
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private String surname;
	private String email;
	private String phone;
	private String address;
	private String number;
	private String city;
	private String state;
	private String zip;
	@OneToOne
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompletName() {
		return name + " " + surname;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public void clone(Contact contact)
	{
		this.name = contact.name;
		this.surname = contact.surname;
		this.email = contact.email;
		this.phone = contact.phone;
		this.address = contact.address;
		this.number = contact.number;
		this.city = contact.city;
		this.state = contact.state;
		this.zip = contact.zip;
		this.user = contact.user;
	}
	
}
