package fleaMarket.a04_restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.Req1000_Service;
import vo.Member;



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
		
		d.addAttribute("DuplicateEmail",service.DuplicateEmail(email));
		
		return "pageJsonReport";
	}
	//이름,주민 중복검사
	//아이디 찾기
	@PostMapping("DuplicateMem.do") 
	public String DuplicateMem(@RequestParam("name") String name
							   ,@RequestParam("personalnumber") String personalnumber						   
							   ,Model d) {	
		d.addAttribute("DuplicateMem",service.DuplicateMem(name,personalnumber,null));
		return "pageJsonReport";
	}
	
	//Sns확인
	@RequestMapping("CheckPeristalsisSNS.do")
	public String CheckPeristalsisSNS(@RequestParam(value="snsemail", required=false) String snsemail,
			@RequestParam(value="name", required=false) String name,Model d){
		if(name==null) {
			d.addAttribute("CheckPeristalsisSNS",service.CheckPeristalsisSNS_K(snsemail));
		}else if(snsemail==null) {
			d.addAttribute("CheckPeristalsisSNS",service.CheckPeristalsisSNS_N(name));
		}
		
		return "pageJsonReport";
	}
	
	
	@PostMapping("MemberFindPassword.do")
	public String MemberFindPassword(Model d,
									  @RequestParam(value="name", required=false) String name,
									  @RequestParam(value="personalnumber", required=false) String personalnumber,
									  @RequestParam(value="email", required=false) String email
									  ,HttpSession session) {
		String MemberFindPassword="";
		if(service.DuplicateMem(name,personalnumber,email)!=null) {
			
			// 비번 업데이트 처리
			service.MemberFindPassword(name,personalnumber,email);
			  MemberFindPassword = name+"님 ("+email+")계정 <br> <span style='color:red;'>임시 비밀번호</span>로 <<span style='color:red;'>1111</span>>로 변경되었습니다.";
		}else {
			MemberFindPassword="조회 된 계정이 없습니다.";
		}
		
		d.addAttribute("MemberFindPassword",MemberFindPassword);	
		return "pageJsonReport";
	}
	
	//비번 맞는지 확인
	@PostMapping("MatchPassword.do")
	public String MatchPassword(Model d,@RequestParam(value="password", required=false) String password,
										@RequestParam(value="sespassword", required=false) String sespassword) {
		String MatchPassword = "false";
		
		if(sespassword.equals("1111") || sespassword.equals("admin")){
			MatchPassword = sespassword.equals(password)?"true":"false";
		}else {
			MatchPassword = BCrypt.checkpw(password,sespassword)?"true":"false";
		}
		
		

		d.addAttribute("MatchPassword",MatchPassword);
		return "pageJsonReport";
	}
}
