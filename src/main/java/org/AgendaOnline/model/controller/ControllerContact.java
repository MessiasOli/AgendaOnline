package org.AgendaOnline.model.controller;

import javax.servlet.http.HttpSession;

import org.AgendaOnline.dto.AppointmentDto;
import org.AgendaOnline.model.Appointment;
import org.AgendaOnline.model.Contact;
import org.AgendaOnline.model.User;
import org.AgendaOnline.model.repository.ContactRepository;
import org.AgendaOnline.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ControllerContact {

	
	ContactRepository repository;
	
	@Autowired
	UserRepository repositoryUser;

	@Autowired
	public ControllerContact(ContactRepository repository) {
		this.repository = repository;
	}
	
	@RequestMapping("contacts")
	public String contact() {
		return "contacts";
	}
	
	@Transactional
	@RequestMapping(value = "registeringContact", method=RequestMethod.POST)
	public String RegisterContact(Contact contact, HttpSession sessao) { 
		contact.setUser((User)sessao.getAttribute("user"));
		repository.insertContact(contact);
		return "redirect:listingContacts";
	}
	
	@RequestMapping("listingContacts")
	public String listContacts(Model model, HttpSession sessao) {
		User user = (User)sessao.getAttribute("user");
		if (user != null) 
		{
			model.addAttribute("contacts", repository.listContacts(user));
			return "listContacts";
		}
		return "login";
	}
	
	@Transactional
	@RequestMapping(value="deleteContact", method=RequestMethod.GET)
	public String deleteContact(HttpSession sessao, int id) {
		User user = (User)sessao.getAttribute("user");
		if (user != null) 
		{
				repository.delete(id);
				return "redirect:listingContacts";
		}
		return "login";
	}
	
	@Transactional
	@RequestMapping(value="editContact", method=RequestMethod.GET)
	public String editContact(HttpSession sessao,Model model, int id) {
		User user = (User)sessao.getAttribute("user");
		if (user != null) 
		{
				model.addAttribute("contact", repository.find(id));
				return "editContact";
		}
		return "login";
	}
	
	@Transactional
	@RequestMapping(value="updateContact", method=RequestMethod.POST)
	public String updateAppointment(HttpSession sessao, Contact contact) {
		User user = (User)sessao.getAttribute("user");
		if( user != null ){
			Contact cont = new Contact();
			cont.clone(contact);
			
			repository.delete(contact.getId());
			repository.insertContact(cont);
			
			return "redirect:listingAppointments";
		}
		return "login";
	}
}
