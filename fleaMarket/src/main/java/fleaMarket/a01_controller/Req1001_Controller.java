package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("Req1001")
public class Req1001_Controller {
	//http://localhost:7080/fleaMarket/AdminSearch.do
	@RequestMapping("AdminSearch.do")
	public String AdminSearch() {
			return "AdminSearch";
	}
	
	//http://localhost:7080/fleaMarket/AdminPost.do
	@RequestMapping("AdminPost.do")
	public String AdminPost() {
		return "AdminPost";
	}
}
