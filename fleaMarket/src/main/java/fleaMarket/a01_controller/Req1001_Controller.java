package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import fleaMarket.a02_service.Req1001_Service;
import vo.Member;


@Controller("Req1001")
public class Req1001_Controller {
	
	@Autowired
	private Req1001_Service service;
	//http://localhost:7080/fleaMarket/AdminIntro.do 회사소개
	@RequestMapping("AdminIntro.do")
	public String AdminIntro() {
		return "AdminIntro";
	}
	//http://localhost:7080/fleaMarket/QNA.do 고객센터
	@RequestMapping("QNA.do")
	public String QNA() {
		return "QNA";
	}
	
	//http://localhost:7080/fleaMarket/AdminSearch.do 관리자 회원조회
	@RequestMapping("AdminSearch.do")
	public String AdminSearch(@ModelAttribute("sch")Member sch, Model d) {
		d.addAttribute("MemberList",service.MemberList(sch));
			return "AdminSearch";
	}
	//http://localhost:7080/fleaMarket/AdminInquire.do 관리자 문의사항 답변 조회
	@RequestMapping("AdminInquire.do")
	public String AdminInquire() {
		return "AdminInquire";
	}
	
	//http://localhost:7080/fleaMarket/AdminPost.do 관리자 공지사항 작성조회
	@RequestMapping("AdminPost.do")
	public String AdminPost() {
		return "AdminPost";
	}
	//http://localhost:7080/fleaMarket/MemberInfo.do 마이페이지 내 정보
	@RequestMapping("MemberInfo.do")
	public String MemberInfo() {
		return "MemberInfo";
	}
	//http://localhost:7080/fleaMarket/MemberInquire.do 마이페이지 문의사항 조회
	@RequestMapping("MemberInquire.do")
	public String MemberInquire() {
		return "MemberInquire";
	}
}
