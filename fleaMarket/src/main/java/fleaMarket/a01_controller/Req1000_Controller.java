package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a02_service.Req1000_Service;
import vo.Member;
import vo.ProfileImg;

@Controller("Req1000")
public class Req1000_Controller {
	private final Req1000_Service service;
	@Autowired
	public Req1000_Controller(Req1000_Service service) {
		this.service = service;
	}
	
	@GetMapping("SignIn.do")
	public String login() {
		return "SignIn";
	}
	
	@RequestMapping("SignUp.do")
	public String SignUp() {
		return "SignUp";
	}
	
	@PostMapping("DuplicateEmail.do") //이메일 중복검사
	public String DuplicateEmail(@RequestParam("email") String email,Model d) {
		System.out.println(email);
		d.addAttribute("DuplicateEmail",service.DuplicateEmail(email));
		return "pageJsonReport";
	}
	@PostMapping("DuplicateMem.do") //이름,주민 중복검사
	public String DuplicateMem(@RequestParam("name") String name
							   ,@RequestParam("personalnumber") String personalnumber
							   ,Model d) {	
		d.addAttribute("DuplicateMem",service.DuplicateMem(name,personalnumber));
		return "pageJsonReport";
	}
	
	@RequestMapping("insSignUp.do")
	public String SignUp(Member ins,
			@RequestParam("profileimg") MultipartFile profile
			//@RequestParam("buisnessfile") MultipartFile buisnessfile
			){
			//1. 기본 회원가입 양식
				service.SignUp(ins);
			//2. 파일처리
				ProfileImg fins = new ProfileImg();
				fins.setEmail(ins.getEmail());
				fins.setProfileimg("defaultprofile.png");
				if(profile.getOriginalFilename()!="") {
				  fins.setProfileimg(service.insprofileimg(profile));
				}
				service.insprofile(fins);			
			//3. 신청처리
				/*
				if(profile.getOriginalFilename()!="") {
					//여기는 신청받는 부분으로 채워야할듯
				}
				*/
		return "SignIn";
	}
}
