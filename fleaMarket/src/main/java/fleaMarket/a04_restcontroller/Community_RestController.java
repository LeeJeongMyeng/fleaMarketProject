package fleaMarket.a04_restcontroller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.CommunitySelectService;

@Controller
public class Community_RestController {
	
	
	private CommunitySelectService service;
	private final Logger logger = LoggerFactory.getLogger(Community_RestController.class);

	/**
	 * @param service
	 */
	@Autowired
	public Community_RestController(CommunitySelectService service) {
		this.service = service;
	}
	@GetMapping("/selectFriend.do")
	public String selectFriend(@RequestParam("communityNumber") String communityNumber,@RequestParam("myEmail") String myEmail,Model model) {
		int followCheck = service.getFollowYesOrNot(communityNumber,myEmail);
		model.addAttribute("followCheck",followCheck);
		return "pageJsonReport";
	}
	//following
	@PostMapping("/insertFriend.do")
	public String insertFriend(@RequestBody String email, Model model) throws Exception {
		String JsonData = email;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(JsonData);
		JSONObject jsonObj = (JSONObject) obj;
		
		String myEmail = (String)jsonObj.get("myEmail");
		String following = (String)jsonObj.get("following");
	    int ikey = service.getInsertFriend(myEmail, following);
		logger.info("json="+ikey);
		
		model.addAttribute(ikey);
		return "pageJsonReport";
	}
	//delete
	@PostMapping("/deleteFriend.do")
	public String deleteFriend(@RequestBody String email,Model model) throws Exception {
		String JsonData = email;
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(JsonData);
		JSONObject jsonObj = (JSONObject) obj;
		
		String myEmail = (String)jsonObj.get("myEmail");
		String following = (String)jsonObj.get("following");
	    int ikey = service.getDeleteFriend(myEmail, following);
		logger.info("json="+ikey);
		String msg = "";
		if(ikey==1) {
			msg = "success";
		}else {
			msg = "fail";
		}
		model.addAttribute(msg);
		return "pageJsonReport";
	}

}
