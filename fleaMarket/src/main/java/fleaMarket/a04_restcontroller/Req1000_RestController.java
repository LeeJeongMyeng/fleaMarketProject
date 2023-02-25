package fleaMarket.a04_restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.Req1000_Service;



@Controller
public class Req1000_RestController {
	private final Req1000_Service service;
	@Autowired
	public Req1000_RestController(Req1000_Service service) {
		this.service = service;
	}
	
	 //이메일 중복검사
	@PostMapping("DuplicateEmail.do")
	public String DuplicateEmail(@RequestParam("email") String email,Model d) {
		System.out.println(email);
		d.addAttribute("DuplicateEmail",service.DuplicateEmail(email));
		return "pageJsonReport";
	}
	//이름,주민 중복검사
	@PostMapping("DuplicateMem.do") 
	public String DuplicateMem(@RequestParam("name") String name
							   ,@RequestParam("personalnumber") String personalnumber
							   ,Model d) {	
		d.addAttribute("DuplicateMem",service.DuplicateMem(name,personalnumber));
		return "pageJsonReport";
	}
	
	//Sns확인
	@RequestMapping("CheckPeristalsisSNS.do")
	public String CheckPeristalsisSNS(@RequestParam("snsemail") String snsemail,Model d){
		d.addAttribute("CheckPeristalsisSNS",service.CheckPeristalsisSNS(snsemail));
		return "pageJsonReport";
	}
}
