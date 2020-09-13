package org.AgendaOnline.model.controller;

import javax.servlet.http.HttpSession;

import org.AgendaOnline.model.User;
import org.AgendaOnline.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerAuthenticator {

	private UserRepository userRepository;
	
	@Autowired
	public ControllerAuthenticator(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@RequestMapping("login")
	public String loginForm() {
		try {
		return "login";
		}catch (Exception e){
			return "login";
		}
	}
	
	@Transactional
	@RequestMapping(value="autenticar", method=RequestMethod.POST)
	public String authenticator(User user, HttpSession sessao) {
		user = userRepository.userAuthentic(user);
		if(user != null) { 
			sessao.setAttribute("user", user);
			return "redirect:main";
		}
			return "redirect:login";
	}
	
	@RequestMapping(value="main")
	public String goMain(HttpSession sessao) {
		if(sessao.getAttribute("user") != null) {
		return "main";
		}else 
			return "redirect:logout";
		
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession sessao) {
		sessao.removeAttribute("User");
		sessao.invalidate();
		return "login";
	}
}
