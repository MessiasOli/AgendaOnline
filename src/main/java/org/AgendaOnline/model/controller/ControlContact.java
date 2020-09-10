package org.AgendaOnline.model.controller;

import javax.servlet.http.HttpSession;

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

@Controller
public class ControlContact {

	
	ContactRepository repository;
	
	@Autowired
	UserRepository repositoryUser;

	@Autowired
	public ControlContact(ContactRepository repository) {
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
	
	@Transactional
	@RequestMapping(value = "deleteContact")
	public String delete(Contact contact) {
		Contact cont = repository.find(contact.getId());
		repository.delete(cont);
		return "redirect:listingContacts";
	}
	
	@RequestMapping("listingContacts")
	public String listContacts(Model model, HttpSession sessao) {
		User user = (User)sessao.getAttribute("user");
		model.addAttribute("contacts", repository.listContacts(user));
		
		return "listContacts";
	}
}
