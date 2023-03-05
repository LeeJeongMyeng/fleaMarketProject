package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 신청글 등록
	@PostMapping("insApp.do")
   public String insApp(FApplication ins, Model d, MultipartFile profile) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+profile.getOriginalFilename());
       //1. 플리마켓 홍보글 등록
		
       //service.insertFleaMarket(ins);   
      //2. 파일 경로 처리
       //FFile fins = new FFile(); 
         /* fins.setFilePath(profilepath); */
       /*
      if(pro.size()!=0) {
         for(MultipartFile f : pro) {
               String filename=fileservice.insprofileimg(profilepath,f);
               FFile fins = new FFile(filename,profilepath); 
               service.insprofile(fins);
               */
                //fins.setFilePath(fileservice.insprofileimg(profilepath,profile)); 
            
         //}
			return "redirect:fmView.do";
      }
	
	// 받은 신청 전체 조회(최신순)
	/*
	@RequestMapping("appReceivedList.do")
	public String appReceivedList(@ModelAttribute("sch") FApplication sch,Model d) {
		d.addAttribute("list", service.appReceivedList(sch));
		return "appReceivedList";
	}
	*/
	// 받은 신청 상세 조회
	/*
	@GetMapping("appReceivedView.do")
	public String appReceivedView(@RequestParam("applicationNo") int applicationNo, Model d) {
		d.addAttribute("appReceived",service.appReceivedView(applicationNo));
		return "pageJsonReport";
	}
	*/
	// 받은 신청 승인
	/*
	@GetMapping("updateAppRe.do")
	public String updateAppRe(FApplication upt,  Model d) {
		service.updateAppRe(upt);
		d.addAttribute("appReceived",service.appReceivedView(upt.getApplicationNo()));
		d.addAttribute("list",service.appReceivedList(upt));
		return "pageJsonReport";
	}
	*/
	// 내 신청 목록
	@RequestMapping("appMyList.do")
	public String appMyList() {
		return "appMyList";
	}
}
