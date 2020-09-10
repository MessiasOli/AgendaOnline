package org.AgendaOnline.model.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.AgendaOnline.dto.AppointmentDto;
import org.AgendaOnline.model.Appointment;
import org.AgendaOnline.model.Contact;
import org.AgendaOnline.model.User;
import org.AgendaOnline.model.repository.AppointmentRepository;
import org.AgendaOnline.model.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerAppointment {

	private AppointmentRepository repository;
	
	@Autowired
	private ContactRepository contactRepository;

	@Autowired
	public ControllerAppointment(AppointmentRepository appointmentRepository) {
		this.repository = appointmentRepository;
	}
	
	@RequestMapping("appointment")
	public String appointment(HttpSession sessao) {
		User user = (User)sessao.getAttribute("user");
		if( user != null ) {
			sessao.setAttribute("contacts", contactRepository.listContacts(user));	
			return "appointment";
		}
		return "redirect:logout";
	}
	
	
	@Transactional
	@RequestMapping(value = "deleteAppointment")
	public String delete(Appointment appointment) {
		Appointment appoint = repository.find(appointment.getId());
		repository.delete(appoint);
		return "redirect:listingAppointments";
	}
	
	@Transactional
	@RequestMapping(value="registeringAppointment", method=RequestMethod.POST)
	public String RegisterAppointment(AppointmentDto appoint, HttpSession sessao) {
		User user = (User)sessao.getAttribute("user"); 
		if( user != null ){
			Appointment appointment = new Appointment();
			appointment.clone(appoint);
			appointment.setUser(user);
			appointment.setContact(contactRepository.find(appoint.getContactId()));
			repository.insertAppointment(appointment);
			return "redirect:listingAppointments";
		
		}
		return "redirect:logout";
	}
	
	@RequestMapping("listingAppointments")
	public String listAppointments(Model model, HttpSession sessao) {
		User user = (User)sessao.getAttribute("user");
		if( user != null ){
			model.addAttribute("user", sessao.getAttribute("user"));
			model.addAttribute("appointments", repository.listAppointments(user));
			return "listAppointments";
		}
		return "redirect:logout";
	}
}
