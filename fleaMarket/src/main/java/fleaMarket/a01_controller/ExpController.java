package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExpController {
	
	@GetMapping("login.do")
	public String login() {
		
		return "WEB-INF\\views\\login.jsp";
	}
	
}
