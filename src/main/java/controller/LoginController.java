package controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("/login")
	public String login() {
		
		logger.info("/login [GET]성공");
		
		return "login/login";
	
	}
	
	@GetMapping("/login/findid")
	public String findid() {
		
		logger.info("/login/findid [GET]성공");
		
		return "login/findid";
	
	}
	
	@GetMapping("/login/findpw")
	public String findpw() {
		
		logger.info("/login/findpw [GET]성공");
		
		return "login/findpw";
	
	}
}
