package org.AgendaOnline.model.controller;

import javax.servlet.http.HttpSession;

import org.AgendaOnline.dto.AppointmentDto;
import org.AgendaOnline.model.Appointment;
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
	
	@Transactional
	@RequestMapping(value="deleteAppointment", method=RequestMethod.GET)
	public String deleteAppointment(HttpSession sessao, int id) {
		User user = (User)sessao.getAttribute("user");
		if( user != null ){
			repository.delete(id);
			
			return "redirect:listingAppointments";
		}
		return "redirect:logout";
	}
	
	@RequestMapping(value="editAppointment", method=RequestMethod.GET)
	public String editAppointment(HttpSession sessao, Model model, int id) {
		User user = (User)sessao.getAttribute("user");
		if( user != null ){
			Appointment appointment = repository.find(id);
			String[] date = appointment.getDate().toString().split(" ");
			String time = date[1].replace(".0", "");
			
			model.addAttribute("appointment", appointment);
			model.addAttribute("date", date[0]);
			model.addAttribute("time", time);
			model.addAttribute("contacts", contactRepository.listContacts(user));	
			
			return "editAppointment";
		}
		return "redirect:logout";
	}
	
	@Transactional
	@RequestMapping(value="updateAppointment", method=RequestMethod.POST)
	public String updateAppointment(HttpSession sessao, AppointmentDto appoint) {
		User user = (User)sessao.getAttribute("user");
		if( user != null ){
			Appointment appointment = new Appointment();
			appointment.clone(appoint);
			appointment.setUser(user);
			appointment.setContact(contactRepository.find(appoint.getContactId()));
			
			repository.delete(appoint.getId());
			repository.insertAppointment(appointment);
			
			return "redirect:listingAppointments";
		}
		return "redirect:logout";
	}
}
