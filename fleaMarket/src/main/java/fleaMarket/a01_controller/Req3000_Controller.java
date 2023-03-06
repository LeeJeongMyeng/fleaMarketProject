package fleaMarket.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.Req3000_Service;
import fleaMarket.util.FileService;
import vo.FFile;
import vo.FleaMarket;

@Controller("fleamarket")
public class Req3000_Controller {

	private Req3000_Service service;

	@Autowired(required = false)
	public Req3000_Controller(Req3000_Service service) {
		this.service = service;
	}
	
	//캘린더 
	@RequestMapping("/calendarAjax.do")
	public String calendarAjax(Model d) {
		d.addAttribute("callist", service.calList());
		return "pageJsonReport";
	}
	
	//파일 업로드 
	  @Autowired 
	  private FileService fileservice;
	  
	  @Value("${fleamarket.upload3}") 
	  private String profilepath;
	  
//http://localhost:7030/fleaMarket/fRegistration.do	
	@RequestMapping("fRegistration.do")
	public String fRegistration() {

		return "FleaMarketRegistration";
	}

	@PostMapping("fleaMarketins.do")
	public String fleaMarketins(FleaMarket ins, RedirectAttributes rttr, List<MultipartFile> pro) {
	    //1. 플리마켓 홍보글 등록
		 service.insertFleaMarket(ins);	
		 
		//2. 파일 경로 처리
		if(pro.size()!=0) {
			for(MultipartFile f : pro) {
					String filename=fileservice.insprofileimg(profilepath,f);
					
					FFile fins = new FFile(filename,profilepath); 
					//첨부파일 DB에 넣기                                   
					service.insprofile(fins);
			}
		}
		 // redirect로는 model를 받아 줄 수 없음 RedirectAttributes 사용을 해야함
		 rttr.addFlashAttribute("msg","등록 성공");
		return "redirect:fRegistration.do"; // 조회페이지로 이동
	}
	
	
//수정하기	
//http://localhost:7030/fleaMarket/FleaMarketUptPage.do	
	@RequestMapping("FleaMarketUptPage.do")
	public String FleaMarketUptPage(Model d) {
	
		return "FleaMarketUpt";
	}
	
	//홍보글 수정하기 
	@RequestMapping("FleaMarketUpt.do")
	public String FleaMarketUpt(FleaMarket upt, Model d,MultipartFile profile) {
		service.UptFleaMarket(upt);
		d.addAttribute("msg", "수정완료");
		return "redirect:FleaMarketUptPage.do";
	} 
	
//삭제하기	
	//http://localhost:7030/fleaMarket/FleaMarketDelPage.do		
	@RequestMapping("FleaMarketDelPage.do")
	public String FleaMarketDelPage() {
	
		return "FleaMarketDel";
	}
	
	
//삭제버튼 클릭시	
	@RequestMapping("FleaMarketDel.do")
	public String FleaMarketDel(@RequestParam("postingNumber") String postingNumber) {
		service.delFleaMarket(postingNumber);
		//삭제 버튼 페이지(임의로 설정)
		return "redirect:fRegistration.do";
	}	
	
//전체 조회 
//	http://localhost:7030/fleaMarket/totalSearch.do
	@RequestMapping("totalSearch.do")
	public String totalSearch(@ModelAttribute("sch") FleaMarket sch, Model d) {
	d.addAttribute("flist",service.getFleaMarketList(sch));
	d.addAttribute("fnolist",service.FileNum(sch));
		return "FleaMarketOverallCheck";
	}
	

	
	
	
}
