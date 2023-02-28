package fleaMarket.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a02_service.Req3000_Service;
import vo.FleaMarket;





@Controller("fleamarket")
public class Req3000_Controller {
	private Req3000_Service service;
	@Autowired
//http://localhost:7030/fleaMarket/fRegistration.do
	@RequestMapping("fRegistration.do")
	public String fRegistration() {
	
		return "FleaMarketRegistration";
	}

	 @RequestMapping("/fleaMarketins.do") 
	 public String fleaMarketins(FleaMarket ins, Model d) { 
		System.out.println(ins.getTitle());
		 
			/* service.insertFleaMarket(ins); */
		 return "redirect:fRegistration.do"; 
	}

	
	@RequestMapping("fileupload.do")
	public String fileupload(@RequestParam("filePath") MultipartFile profile) {
		System.out.println("getName:"+profile.getName());
		System.out.println("getOriginal:"+profile.getOriginalFilename());
		System.out.println("toString:"+profile.toString());

		//redirect:fRegistration.do
		return "redirect:fRegistration.do";
	}
}
