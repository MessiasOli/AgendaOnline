package org.AgendaOnline.model.controller;

import org.AgendaOnline.model.User;
import org.AgendaOnline.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@ComponentScan(basePackageClasses= {ControllerUser.class, UserRepository.class})
public class ControllerUser {
	
	private UserRepository userRepository;
	
	@Autowired
	public ControllerUser(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Transactional
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerUserForm(User user) {
		userRepository.register(user);
		return "login";	
	}
	
}
