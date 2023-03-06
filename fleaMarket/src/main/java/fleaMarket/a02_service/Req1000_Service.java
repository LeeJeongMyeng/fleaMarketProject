package fleaMarket.a02_service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;

@Service
public interface Req1000_Service  {
	public Member DuplicateEmail(String email);
	public Member DuplicateMem(String name,String personalnumber,String email);
	public void SignUp(Member ins);
	public void insprofile(String email,MultipartFile profile); //회원 이미지파일 테이블insert
	public Member Login(Member log);
	public Member CheckPeristalsisSNS_K(String snsemail);
	public Member CheckPeristalsisSNS_N(String naveremail);
	public void SnsEmailPlus(Member upt);
	public void MemberFindPassword(String name,String personalnumber,String email);
	public Member ReLogin(String email);
	//문의글내용 DB삽입
	public void QNAInsert(QNA ins);
	//문의글파일 업로드+DB삽입
	public void QNAFileInsert(String qnano,List<MultipartFile> fileList);
	//문의글내용 DB업뎃
	public void QNAUpdate(QNA upt);
	//문의글 내용 삭제 및 파일삭제
	public void QNAFileDelete(String qnano);
	public List<QNAFile> GetFileNames(String qnano);
}
