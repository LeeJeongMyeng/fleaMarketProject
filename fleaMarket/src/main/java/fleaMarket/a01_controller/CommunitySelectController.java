package fleaMarket.a01_controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.CommunityReplyService;
import fleaMarket.a02_service.CommunitySelectService;
import vo.CapplicationList;
import vo.Criteria;
import vo.PageDTO;
import vo.ReplyVo;

@Controller
public class CommunitySelectController {
	
	private CommunitySelectService service;
	//생성자 주입하기
	private CommunityReplyService repservice;
	
	// 커뮤니티 조회 컨트롤러 
	private final Logger logger = LoggerFactory.getLogger(CommunitySelectController.class);
	
    /**
	 * @param service
	 */
	
	
	
	
	/**
	 * @param service
	 * @param repservice
	 */
	@Autowired
	public CommunitySelectController(CommunitySelectService service, CommunityReplyService repservice) {
		
		this.service = service;
		this.repservice = repservice;
	}




	//기본 조회(get)
	@GetMapping("CommunityList.do")
	public String communityList(@RequestParam(value = "showTemplete",required = false , defaultValue="all") String showTemplete,Model model,Criteria cri) throws Exception{
		// 변수도 넣을수 있고, 객체도 넣어서 확인가능 
		// info는 debug 보다 더 작은 Level 만 확인가능 
		// sysout == info로 쓰셈
		/*
		Member m = (Member) session.getAttribute("Login");
		String email = m.getEmail();
		*/
		logger.info("log"+cri);
		
		List<CapplicationList> clist;
		if(showTemplete.equals("all") || showTemplete == "") {
			clist = service.getCommunityList(cri);
			model.addAttribute("bestValue",showTemplete);
			model.addAttribute("list",clist);
			model.addAttribute("pageMaker",new PageDTO(cri,service.getCommunitySelectNum(cri)));
		}
		if(showTemplete.equals("best")) {
			//인기글 처리
			clist = service.getCommunityBestList(cri);
			model.addAttribute("bestValue",showTemplete);
			model.addAttribute("list",clist);
			model.addAttribute("pageMaker",new PageDTO(cri,service.getCommunityBestCount(cri)));
		}
		//페이지 적용 리스트 
		
		/* 총 게시물 처리*/
	
		return "communitySelect";
	}
	
	//상세 조회(get)
	@GetMapping("CommunityDetail.do")
	public String communityDetailList(@RequestParam("communityNumber") int communityNumber,Model model) throws Exception {
		//세션처리 
		String sessions = "pucoca@naver.com";
		//상세조회 정보 
		List<CapplicationList> clist = service.getCommunityDetailList(communityNumber);
		//이미지 다중불러오기.
		List<String> imgList = service.getCommunityImg(communityNumber);
		//int followCheck 처리 
		int followCheck = service.getFollowYesOrNot(communityNumber, sessions);
		//int 좋아요 처리 
		int likeCheck = service.getLikeYesOrNot(communityNumber, sessions);
		
		List<ReplyVo> replyList = repservice.replyList(communityNumber);
				
		
		model.addAttribute("dlist",clist);
		
		model.addAttribute("imgList",imgList);
		
		model.addAttribute("followCheck",followCheck);
		
		model.addAttribute("session",sessions);
		
		model.addAttribute("likeCheck",likeCheck);
		
		model.addAttribute("replyList",replyList);
		
		return "communityDetail";
	}
	
	@PostMapping("writeReply.do")
	public String writeReply(@RequestParam int communitynumber,@RequestParam String content,String email) {
		email = "pucoca@naver.com";
		ReplyVo vo = new ReplyVo();
		vo.setCommunityNumber(communitynumber);
		vo.setRepcontent(content);
		vo.setEmail(email);
		//나중에 등록, 리스트 구현 후 개수 받아올 예정 
		int result = repservice.insertReply(vo);
		
		return "communityDetail";
	}
	
}
