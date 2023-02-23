package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("Req1000")
public class Req1000_Controller {
	
	@GetMapping("login.do")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("SignUp.do")
	public String SignUp() {
		return "SignUp";
	}
}
