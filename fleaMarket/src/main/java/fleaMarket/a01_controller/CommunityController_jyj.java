package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController_jyj {
	
	@RequestMapping("communityinsert.do")
	public String communityInsert() {
		return "communityInsert";
	}
	@RequestMapping("communityUpdate.do")
	public String communityUpdate() {
		return "communityUpdate";
	}
	@RequestMapping("chatting.do")
	public String chatting() {
		return "communityChatAll";
	}
}
