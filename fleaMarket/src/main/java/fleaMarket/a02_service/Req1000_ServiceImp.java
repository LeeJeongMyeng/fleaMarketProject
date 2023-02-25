package fleaMarket.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req1000_Dao;
import vo.Member;
import vo.ProfileImg;

@Service
public class Req1000_ServiceImp implements Req1000_Service {
	@Value("${profile.upload}")
	private String profilepath;
	
	private Req1000_Dao dao;
	@Autowired
	public Req1000_ServiceImp(Req1000_Dao dao) {
		this.dao = dao;
	}
	
	public Member DuplicateEmail(String email) {
		System.out.println("dd:"+email);
		return dao.DuplicateEmail(email);
	}
	public Member DuplicateMem(String name,String personalnumber) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		return dao.DuplicateMem(map);
	}
	public void SignUp(Member ins) {
		dao.SignUp(ins);
	}
	public String insprofileimg(MultipartFile report) {
			String fname = report.getOriginalFilename();
			File f = new File(profilepath+fname);
			try {
				report.transferTo(f); // 필수예외 처리 (IO발생)
			} catch (IllegalStateException e) {
				System.out.println("파일업로드 예외1:"+e.getMessage());
			} catch (IOException e) {
				System.out.println("파일업로드 예외2:"+e.getMessage());
			} 
		
		return fname; //일단  db업로드 해야하니까 
	}
	public void insprofile(ProfileImg fins) {
		dao.insprofile(fins);
	}
}
