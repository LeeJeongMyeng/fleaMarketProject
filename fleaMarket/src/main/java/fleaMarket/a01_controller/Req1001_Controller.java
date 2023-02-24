package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("Req1001")
public class Req1001_Controller {
	//http://localhost:7080/fleaMarket/MemberSearch.do
	@RequestMapping("MemberSearch.do")
	public String MemberSearch() {
			return "MemberSearch";
	}
	//http://localhost:7080/fleaMarket/MemberMypost.do
	@RequestMapping("MemberMypost.do")
	public String MemberMypost() {
		return "MemberMypost";
	}
}
