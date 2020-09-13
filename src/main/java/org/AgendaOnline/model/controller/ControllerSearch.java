package org.AgendaOnline.model.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.AgendaOnline.model.Appointment;
import org.AgendaOnline.model.Contact;
import org.AgendaOnline.model.User;
import org.AgendaOnline.model.repository.AppointmentRepository;
import org.AgendaOnline.model.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerSearch {
	
	@Autowired
	private AppointmentRepository rptAppointment;
	@Autowired
	private ContactRepository rptContact;
	
	@RequestMapping(value="shearch", method=RequestMethod.POST)
	public String search(String str, HttpSession sessao, Model model) {
		User user = (User)sessao.getAttribute("user");
		
		if(user != null) {
			List<Contact> contacts = findByContacts(str, user);
			model.addAttribute("stShearch", str);
			if(contacts != null)
			{
				model.addAttribute("contacts", contacts);
			}
			
			List<Appointment> appointments = findByAppointments(str, user);
			if(appointments != null)
			{
				model.addAttribute("appointments", appointments);
			}
			return "shearchFound";
		}
		return "login";
	}
	
	private List<Contact> findByContacts(String str, User user) {
		List<Contact> contacts = new ArrayList<Contact>();
		for(Contact cont : rptContact.listContacts(user)) {
			if (cont.getName().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getSurname().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getAddress().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getCity().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getEmail().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getNumber().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getState().toUpperCase().contentEquals(str.toUpperCase()) ||
				cont.getZip().toUpperCase().contentEquals(str.toUpperCase())) {
				
				contacts.add(cont);
			}
		}
		if (contacts.size() > 0) {
			return contacts;
		}
		return null;
	}
	
	private List<Appointment> findByAppointments(String str, User user){
		List<Appointment> appointments = new ArrayList<Appointment>();
		for(Appointment appoint : rptAppointment.listAppointments(user)) {
			if (appoint.getDescription().toUpperCase().contentEquals(str.toUpperCase()) ||
				appoint.getLocal().toUpperCase().contentEquals(str.toUpperCase()) ||
				appoint.getDate().toString().toUpperCase().contentEquals(str.toUpperCase()) ||
				appoint.getContact().getName().toUpperCase().contentEquals(str.toUpperCase()))
				appointments.add(appoint);
		}
		if (appointments.size() > 0) {
			return appointments;
		}
			return null;
	}
}
