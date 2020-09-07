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
public class ControlAuthenticator {

	private UserRepository userRepository;
	
	@Autowired
	public ControlAuthenticator(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@RequestMapping("login")
	public String loginForm() {
		return "login";
	}
	
	@Transactional
	@RequestMapping(value="autenticar", method=RequestMethod.POST)
	public String authenticator(User user, HttpSession sessao) {
		if(userRepository.userAuthentic(user)) {
			sessao.setAttribute("user", user);
			return "main";
		}
			return "redirect:login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession sessao) {
		sessao.removeAttribute("User");
		sessao.invalidate();
		return "login";
	}
}
