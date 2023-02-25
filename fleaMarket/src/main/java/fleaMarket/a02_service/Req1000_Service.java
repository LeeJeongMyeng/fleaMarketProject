package fleaMarket.a02_service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vo.Member;
import vo.ProfileImg;

@Service
public interface Req1000_Service {
	public Member DuplicateEmail(String email);
	public Member DuplicateMem(String name,String personalnumber);
	public void SignUp(Member ins);
	public String insprofileimg(MultipartFile report); //파일 업로드 처리
	public void insprofile(ProfileImg fins); //회원 이미지파일 테이블insert
}
