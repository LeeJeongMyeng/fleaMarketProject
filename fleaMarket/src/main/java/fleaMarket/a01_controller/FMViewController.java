package fleaMarket.a01_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fleaMarket.a02_service.FMViewService;
import fleaMarket.util.FileService;
import vo.ApplicationFile;
import vo.FApplication;
import vo.FApplicationSch;
import vo.Member;

@Controller
public class FMViewController {
	@Autowired(required=false)
	private FMViewService service;
	
	@Autowired
	private FileService fileservice;

	@Value("${fleamarket.upload3}")
	private String fmPath;
	
	@Value("${app.upload}")
	private String appPath;
	 
	 
	 
	// 홍보글 상세 조회
	@GetMapping("fmView.do")
	public String fmView(@RequestParam("postingNumber") String postingNumber, Model d) {
		Map<String, Object> map = new HashMap<String,Object>();
		 map = service.devideFmFile(postingNumber); //map 1.imgfiles 2.noimgfiles
		d.addAttribute("imgfiles",map.get("imgfiles"));
		d.addAttribute("noimgfiles",map.get("noimgfiles"));
		d.addAttribute("fleamarket",service.fmView(postingNumber));
		return "fleaMarketView";
	}
	
	// 홍보글 파일 다운로드
	@GetMapping("downloadFFile.do")
	public String downloadFFile(@RequestParam("filename") String filename, Model d) {
		d.addAttribute("downloadPath",fmPath);
		d.addAttribute("downloadName",filename);
		return "downloadView";
	}
	
	// 신청글 + 파일첨부 등록
	@PostMapping("/insApp.do")
	public String insApp(FApplication ins, RedirectAttributes rttr, MultipartHttpServletRequest appFile){
		
		service.insApp(ins);

		List<MultipartFile> fileList = appFile.getFiles("appFile");
		 
		// 들어온 파일이 있다면 실행
		if(fileList!=null) {
			String filenames = "";
			int indexnum =0;
			for (MultipartFile mf : fileList) {
				 if(indexnum==fileList.size()-1) {
					 filenames += fileservice.insprofileimg(appPath, mf);
				 }else {
					 filenames += fileservice.insprofileimg(appPath, mf)+","; 
				 }
				 indexnum++;
			 }
			 ApplicationFile af = new ApplicationFile();
			 af.setFilename(filenames);
			 af.setApplicationNo(ins.getApplicationNo());
			 service.insAppFile(af);
		}
		rttr.addFlashAttribute("msg","등록 성공");
		return "redirect:appReceivedList.do";
	}	
	
	// 받은 신청 전체 조회(최신순)
	@RequestMapping("appReceivedList.do")
	public String appReceivedList(@ModelAttribute("sch") FApplicationSch sch,Model d) {		 
		d.addAttribute("list",service.appReceivedList(sch));
		return "appReceivedList";
	}
	
	// 받은 신청 상세 조회
	@PostMapping("appFileView.do")
	public String appFileView(@RequestParam("applicationNo") int applicationNo, Model d) {
		String a= service.appFileView(applicationNo);
		d.addAttribute("appFile",a);
		return "pageJsonReport";
	}
	
	// 신청글 파일 다운로드
	@GetMapping("downloadAppFile.do")
	public String downloadAppFile(@RequestParam("filename") String filename,Model d) {	
		
		d.addAttribute("downloadPath",appPath);
		d.addAttribute("downloadName",filename);
		return "downloadView";
	}
	
	// 받은 신청 승인
	@PostMapping("updateAppRe.do")
	public String updateAppRe(@RequestParam("applicationNo") String applicationNo,
								@RequestParam("approvalWhether") String approvalWhether,  Model d) {		
		service.updateAppRe(applicationNo,approvalWhether);		 
		return "pageJsonReport";
	}
	
	// 내 신청 전체 조회(최신순) , HttpSession session
	@RequestMapping("appMyList.do")
	public String appMyList(@ModelAttribute("sch") FApplicationSch sch, Model d,HttpSession session) {	
		Member mb = (Member)session.getAttribute("Login");
		sch.setSearch(mb.getEmail());
		d.addAttribute("list",service.appMyList(sch));
		return "appMyList";
	}
	

}
