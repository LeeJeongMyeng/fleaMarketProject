package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.FMViewService;
import vo.FleaMarket;

@Controller
public class FMViewController {
	@Autowired(required=false)
	private FMViewService service;
	@RequestMapping("list.do")
	public String fmList(@ModelAttribute("sch") FleaMarket sch,Model d) {
		d.addAttribute("list", service.fmList(sch));
		return "fmList_test";
	}
	
	// 홍보글 상세페이지
	@GetMapping("getFm.do")
	public String getFm(@RequestParam("postingNumber") String postingNumber, Model d) {
		d.addAttribute("fleamarket",service.getFm(postingNumber));
		return "fleaMarketView";
	}
	
	// 받은 신청 목록
	@RequestMapping("appReceivedList.do")
	public String appReceivedList() {
		return "appReceivedList";
	}
	
	// 내 신청 목록
	@RequestMapping("appMyList.do")
	public String appMyList() {
		return "appMyList";
	}
}
