package fleaMarket.a01_controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.Req1000_Service;
import fleaMarket.util.FileService;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;

@Controller("Req1000")
public class Req1000_Controller {
	private final Req1000_Service service;
	@Autowired
	public Req1000_Controller(Req1000_Service service) {
		this.service = service;
	}

	@Autowired
	private FileService fileservice;
	
	@Value("${profile.upload}")
	private String profilepath;
	
	@Value("${qna.upfile}")
	private String qnafilepath;
	
//=================================================================================
	
	@RequestMapping("SignIn.do")
	public String login() {
		return "SignIn";
	}
	
	@RequestMapping("SignUp.do")
	public String SignUp() {
		return "SignUp";
	}
	
	@RequestMapping("insSignUp.do")
	public String SignUp(Member ins,@RequestParam("profileimg") MultipartFile profile){
			//1. 기본 회원가입 양식
				service.SignUp(ins);
			//2. 파일처리
				ProfileImg fins = new ProfileImg();
				fins.setEmail(ins.getEmail());
				fins.setProfileimg("defaultprofile.png");
				if(profile.getOriginalFilename()!="") {
				  fins.setProfileimg(fileservice.insprofileimg(profilepath,profile));
				}
				service.insprofile(fins);			
			
		return "SignIn";
	}
	
	@RequestMapping("Login.do") //로그인
	public String Loign(Member log,Model d,HttpSession session) {
		Member mem;		
		String msg = "일치하는 회원이 없습니다. 다시 시도 부탁드립니다.";
		String path = "redirect:SignIn.do";
		
		// sns이메일값
		if(d.asMap().get("SnsEmailPlus")!=null) {
			mem = service.Login((Member)d.asMap().get("SnsEmailPlus"));
		// 기본이메일/패스워드
		}else {
			mem = service.Login(log);
		}
		if(mem!=null) {
		session.setAttribute("Login", mem);
		path="main";	
		}
		d.addAttribute("LoginMsg",msg);	
		return path;
	}
	
	
	
	//Sns연동처리
	@RequestMapping("SnsEmailPlus.do")//기존계정에 연동계정 업데이트
	public String SnsEmailPlus(Member upt,RedirectAttributes redirectAttributes) {
		service.SnsEmailPlus(upt);
		// 연동처리 후, 해당 이메일값 전달
		redirectAttributes.addFlashAttribute("SnsEmailPlus",upt);
		return "redirect:Login.do";
	}
	
	@RequestMapping("Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("Login");
		return "SignIn";
	}
	
	
	
	
	//문의글작성페이지
	@RequestMapping("MemberQnAreg.do")
	public String MemberQnAreg() {
		return "QNAInsert";
	}
	
	
	
	//문의글등록
	@PostMapping("QNAInsert.do")
	public String QNAInsert(QNA ins,MultipartHttpServletRequest qnafiles) {
		
		
		
		//여러개 들어온 파일들을 리스트로 받음
		 List<MultipartFile> fileList = qnafiles.getFiles("qnafiles");
		 
		//들어온 글정보부터 입력(중요. 시퀸스넘버때매 무조건 앞에서 해야함)
		 service.QNAInsert(ins);
		 
		//문의글 등록파일 VO객체 생성 
		 QNAFile qf = new QNAFile(); 
		 
		// 리스트로 받은 파일객체들을 심어줌
		 if(fileList!=null) {
		 for (MultipartFile mf : fileList) {
			 //HashMap으로 파일이름과 경로를 반환함
			// 이미지 확장자냐에 따른 경로 심기.
				String imgArray[] = {"gif","jpg","jpeg","png","bmp","ico","apng","jfif"};			
				String subpath ="file/qna/";
				 for(String ia:imgArray) {
					 if(ia.equals(mf.getOriginalFilename().split("\\.")[1])) {
						 subpath = "img/qna/";
					 }
				 }
			
			 //등록파일 vo객체에 set값 할당(for문 돌면서 계속 할당)
				
			 qf.setFilename(fileservice.insprofileimg(qnafilepath+subpath,mf));
			 qf.setFilepath(subpath);
			 
			 //테이블에 심어주기
			 service.QNAFileInsert(qf); 
		 	}
		 }
		return "redirect:MemberQnAListForm.do";
	}

	@PostMapping("QNAUpdate.do")
	public String QNAUpdate() {
		return "redirect:MemberQnAListForm.do";
	}
	
	
	
}
