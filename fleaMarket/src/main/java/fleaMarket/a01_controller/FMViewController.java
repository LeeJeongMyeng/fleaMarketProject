package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a02_service.FMViewService;
import vo.FApplication;
import vo.FleaMarket;

@Controller
public class FMViewController {
	@Autowired(required=false)
	private FMViewService service;
	
	// 홍보글 상세 조회
	@GetMapping("fmView.do")
	public String fmView(@RequestParam("postingNumber") String postingNumber, Model d) {
		d.addAttribute("fleamarket",service.fmView(postingNumber));
		return "fleaMarketView";
	}
	
	// 받은 신청 전체 조회(최신순)
	@RequestMapping("appReceivedList.do")
	public String appReceivedList(@ModelAttribute("sch") FApplication sch,Model d) {
		d.addAttribute("list", service.appReceivedList(sch));
		return "appReceivedList";
	}
	// 받은 신청 상세 조회
	@GetMapping("appReceivedView.do")
	public String appReceivedView(@RequestParam("applicationNo") int applicationNo, Model d) {
		d.addAttribute("appReceived",service.appReceivedView(applicationNo));
		return "pageJsonReport";
	}
	// 받은 신청 승인
	@GetMapping("updateAppRe.do")
	public String updateAppRe(FApplication upt,  Model d) {
		service.updateAppRe(upt);
		d.addAttribute("appReceived",service.appReceivedView(upt.getApplicationNo()));
		d.addAttribute("list",service.appReceivedList(upt));
		return "pageJsonReport";
	}
	// 내 신청 목록
	@RequestMapping("appMyList.do")
	public String appMyList() {
		return "appMyList";
	}
}
