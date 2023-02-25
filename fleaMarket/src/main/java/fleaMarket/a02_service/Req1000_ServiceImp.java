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
	// 이메일 중복검사
	public Member DuplicateEmail(String email) {
		System.out.println("dd:"+email);
		return dao.DuplicateEmail(email);
	}
	// 이름,주민 중복검사
	public Member DuplicateMem(String name,String personalnumber) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		return dao.DuplicateMem(map);
	}
	//회원가입
	public void SignUp(Member ins) {
		dao.SignUp(ins);
	}
	//회원가입 처리 후,이미지 업로드 처리
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
		
		return fname; //db업로드 해야하니까 네임 리턴
	}
	// 테이블에 프로필사진 삽입
	public void insprofile(ProfileImg fins) {
		dao.insprofile(fins);
	}
	
	//로그인 처리
	public Member Login(Member log) {
		if(log.getKakaoemail()!=null) {
			return dao.kakaoLogin(log);
		}else if(log.getNaveremail()!=null) {
			return dao.naverLogin(log);
		}else {
			return dao.Login(log);
		}
		
	}
	
	//카카오연동 여부확인
	public Member CheckPeristalsisSNS_K(String snsemail) {
		return dao.CheckPeristalsisSNS_K(snsemail);
	}
	//네이버 연동
	public Member CheckPeristalsisSNS_N(String name) {
		return dao.CheckPeristalsisSNS_N(name);
	}
	
	public void SnsEmailPlus(Member upt) {
		dao.SnsEmailPlus(upt);
	}
}
