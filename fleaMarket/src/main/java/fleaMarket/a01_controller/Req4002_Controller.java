package fleaMarket.a01_controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.Req4002_Service;
import vo.Capplication;
import vo.FollowMemberInfo;
import vo.RoomMemberInfo;

@Controller
public class Req4002_Controller {
	@Autowired(required=false)
	Req4002_Service service;
	
	@RequestMapping("communityInsertPage.do")
	public String communityInsertPage() {
		return "communityInsert";
	}
	@PostMapping("communityInsert.do")
	public String communityInsert(Capplication ins, Model d) {
		service.communityInsert(ins);
		d.addAttribute("msg", "등록 성공");
		return "communityInsert"; // 전체조회페이지로 이동
	}
	
	@RequestMapping("communityUpdatePage.do")
	public String communityUpdatePage() {
		return "communityUpdate";
	}
	
	@PostMapping("communityUpdate.do")
	public String communityUpdate(Capplication upt, Model d) {
		service.communityUpdate(upt);
		d.addAttribute("msg", "수정 성공");
		return "communityUpdate"; // 상세조회페이지로 이동
	}
	
	@RequestMapping("chatting.do")
	public String chatting() {
		return "communityChatAll";
	}
	
	@RequestMapping("communityFollowMember.do")
	public String communityFollowMember(FollowMemberInfo sel, Model d,HttpSession session) {
		session.getAttribute("Login");
		d.addAttribute("follower", service.followerSelect(sel));
		// System.out.println(service.followerSelect(sel));
		return "communityFollowMember";
	}
	
	@RequestMapping("communityFollowDelete.do")
	public String communityFollowDelete(FollowMemberInfo del, Model d) {
		service.followmemberdelete(del);
		return "communityFollowMember";
	}
	
	@RequestMapping("communityMemberRoom.do")
	public String communityMemberRoom(@RequestParam("email") String email,FollowMemberInfo sel,
			RoomMemberInfo board,Model d) {
		
		// 이메일 정보
		d.addAttribute("roommember", service.roomMemberInfo(email));
		
		// 팔로우 정보
		sel.setMyemail(email);
		d.addAttribute("follower", service.followerSelect(sel));
		// 팔로잉 정보
		FollowMemberInfo following = new FollowMemberInfo();
		following.setMyemail(email);
		following.setDiv("팔로잉");
		d.addAttribute("following", service.followerSelect(following));
		
		// https://mititch.tistory.com/77
		// 정보은닉이 안되어(캡슐화X), 좋지않은코드.. 객체에 직접 데이터 넣기.. Map<String, String> 파라미터명이나, 매퍼 나누기
		// 나의 게시판 정보
//		RoomMemberInfo meboard = new RoomMemberInfo();
//		meboard.setDiv("meboard");
//		meboard.setEmail(email);
//		d.addAttribute("boardreplyInfo", service.boardReplySelect(meboard));
//		
//		// 나의 댓글 정보
//		RoomMemberInfo mereply = new RoomMemberInfo();
//		mereply.setDiv("mereply");
//		mereply.setEmail(email);
//		d.addAttribute("replyInfo", service.boardReplySelect(mereply));
//
//		System.out.println("####나의게시판정보");
//		System.out.println("나의 게시판 정보"+meboard.getDiv());
//		System.out.println("내가쓴 댓글정보"+mereply.getDiv());
		
		Map<String, String> repMap = new HashMap<String, String>();
		repMap.put("email", email);
		
		// 나의 게시판 정보
		repMap.put("div", "meboard");
		d.addAttribute("boardreplyInfo", service.boardReplySelect(repMap));
		
		// 나의 댓글 정보
		repMap.put("div", "mereply");
		d.addAttribute("replyInfo", service.boardReplySelect(repMap));
		
		// 카테고리별 게시판 조회 // 답없다..전체랑 카테고리별 나눠서 진행해라~~~시댕
		 Map<String, String> boardMap = new HashMap<String, String>();
		 boardMap.put("email", email);
		 boardMap.put("category", null);
		
		// 좋아요 누적처리 및 커뮤니티 정보
		int totlike=0;
		for(RoomMemberInfo e:service.boardSelect(boardMap)) {
			totlike += e.getLikecnt();
			System.out.println("좋아요수:"+e.getLikecnt());
			System.out.println("전체좋아요수:"+totlike);
		}
		d.addAttribute("boardInfo", service.boardSelect(boardMap));
		d.addAttribute("likeCnt", totlike);
		
		boardMap.put("category", "홍보글");
		d.addAttribute("adv", service.boardSelect(boardMap));
		
		boardMap.put("category", "사업아이디어");
		d.addAttribute("idea", service.boardSelect(boardMap));
		
		boardMap.put("category", "사는이야기");
		d.addAttribute("life", service.boardSelect(boardMap));
		
		boardMap.put("category", "꿀팁");
		d.addAttribute("tip", service.boardSelect(boardMap)); 
		
		return "communityMemberRoom";
	}
	
	
}
