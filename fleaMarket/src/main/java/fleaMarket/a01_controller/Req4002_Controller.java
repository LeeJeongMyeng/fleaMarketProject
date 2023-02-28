package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Req4002_Controller {
	
	@RequestMapping("communityinsert.do")
	public String communityInsert() {
		return "communityInsert";
	}
	@PostMapping("insertBoard.do")
	public String insertBoard() {
		return "communityinsert.do"; // 조회페이지로 이동
	}
	
	@RequestMapping("communityUpdate.do")
	public String communityUpdate() {
		return "communityUpdate";
	}
	
	@RequestMapping("chatting.do")
	public String chatting() {
		return "communityChatAll";
	}
	@RequestMapping("communityFollowMember.do")
	public String communityFollowMember() {
		return "communityFollowMember";
	}
	
	@RequestMapping("communityMemberRoom.do")
	public String communityMemberRoom() {
		return "communityMemberRoom";
	}
	
}
