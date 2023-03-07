package fleaMarket.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fleaMarket.a03_dao.Req1000_Dao;
import fleaMarket.util.FileService;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;

@Service
public class Req1000_ServiceImp implements Req1000_Service {
	
	
	private Req1000_Dao dao;
	
	@Autowired
	public Req1000_ServiceImp(Req1000_Dao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private FileService fileservice;
	@Value("${profile.upload}")
	   private String profilepath;
	   
	@Value("${qna.upfile}")
	   private String qnafilepath;
	
	HashMap<String,String> map;
	
	
	// 이메일 중복검사
	public Member DuplicateEmail(String email) {
		System.out.println("dd:"+email);
		return dao.DuplicateEmail(email);
	} 
	
	
	
	// 이름,주민 중복검사
	public Member DuplicateMem(String name,String personalnumber,String email) {
		map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		map.put("email",null);
		if(email!=null) {map.put("email",email);}
		return dao.DuplicateMem(map);
	}
	
	
	
	//회원가입
	public void SignUp(Member ins) {		
		ins.setPassword(BCrypt.hashpw(ins.getPassword(), BCrypt.gensalt()));
		dao.SignUp(ins);
	}
	
	
	
	// 테이블에 프로필사진 삽입
	public void insprofile(String email,MultipartFile profile) {
		ProfileImg fins = new ProfileImg();
        fins.setEmail(email);
        fins.setProfileimg("defaultprofile.png");
        if(profile.getOriginalFilename()!="") {
          fins.setProfileimg(fileservice.insprofileimg(profilepath,profile));
        }
		dao.insprofile(fins);
	}
	
	
	
	//로그인 처리
	public Member Login(Member log) {
		Member mem;
		if(log.getKakaoemail()!=null) { //카카오이메일로그인시
			mem = dao.kakaoLogin(log.getKakaoemail());
		}else if(log.getNaveremail()!=null) { //네이버 이메일로그인시
			mem = dao.naverLogin(log.getNaveremail());
		}else { //일반로그인
			mem = dao.Login(log.getEmail());
			if(mem.getPassword().equals("1111") || mem.getPassword().equals("admin")) {
				mem = log.getPassword().equals(mem.getPassword())?mem:null;
			}else {
				mem = BCrypt.checkpw(log.getPassword(),dao.Login(log.getEmail()).getPassword())?mem:null;
			}
		}
		return mem;
	}
	
	
	
	
	//카카오연동 여부확인
	public Member CheckPeristalsisSNS_K(String snsemail) {
		return dao.CheckPeristalsisSNS_K(snsemail);
	}
	
	
	
	//네이버 연동
	public Member CheckPeristalsisSNS_N(String name) {
		return dao.CheckPeristalsisSNS_N(name);
	}
	
	
	
	//계정에 SNS이메일 업뎃
	public void SnsEmailPlus(Member upt) {
		dao.SnsEmailPlus(upt);
	}
	
	
	//비번발급
	public void MemberFindPassword(String name,String personalnumber,String email) {
		map = new HashMap<String,String>();
		map.put("name", name);
		map.put("personalnumber", personalnumber);
		map.put("email",email);
		dao.MemberFindPassword(map);
	}
	
	
	
	//다시로긴
	public Member ReLogin(String email){
		return dao.Login(email);
	}
	
	
	//문의글 등록
	public void QNAInsert(QNA ins) {
		if(ins.getMethod().equals("a")) {ins.setCategory("답변");}
		if(ins.getMethod().equals("n")) {ins.setCategory("공지사항");}
		
		dao.QNAInsert(ins);
	}
	//문의글파일 DB+파일업로드
	public void QNAFileInsert(String qnano,List<MultipartFile> fileList) {
			String filename = "파일1,파일2,파일3,....";
			int idxnum = 0;
			for(MultipartFile mf:fileList){
			dao.QNAFileInsert(insertFileModule(qnano,mf));
			filename+=mf.getOriginalFilename()+",";
			}
	}
	
	//문의글 업뎃
	public void QNAUpdate(QNA upt) {
		dao.QNAUpdate(upt);
	}
	
	//문의글 삭제/업뎃 시 삭제할 파일db정보조회
	public List<QNAFile> GetFileNames(String qnano){
		return dao.GetFileNames(qnano);
	}
	
	//문의글파일 DB+업로드파일삭제
	public void QNAFileDelete(String qnano) {
		
		//파일리스트를 다뽑아옴
		 List<QNAFile> qfs=GetFileNames(qnano);
		//리스트가있다면
		 if(qfs.size()>0 && !qfs.get(0).getFilename().equals("")) {
			//DB다지움
			 dao.QNAFileDelete(qnano);
			//업로드 된거 다 지움
			 for(QNAFile qf:qfs) {
				fileservice.DeleteFile(qnafilepath+qf.getFilepath(), qf.getFilename());
			 }
		  }
	}
	public void QNADelete(String qnano) {
		dao.QNADelete(qnano);
	}
	
	//--------------------------------------------
	// 파일 업로드 처리하고 문의글파일 db에 데이터 삽입
	public QNAFile insertFileModule(String qnano,MultipartFile file) {
		   QNAFile qf = new QNAFile();
		   
		          //HashMap으로 파일이름과 경로를 반환함
		         // 이미지 확장자냐에 따른 경로 심기.
		            String imgArray[] = {"gif","jpg","jpeg","png","bmp","ico","apng","jfif"};         
		            String subpath ="file/qna/";
		             for(String ia:imgArray) {
		                if(ia.equals(file.getOriginalFilename().split("\\.")[1])) {
		                   subpath = "img/qna/";
		                }
		             }
		          //등록파일 vo객체에 set값 할당(for문 돌면서 계속 할당)
		          qf.setQnano(qnano);
		          qf.setFilename(fileservice.insprofileimg2(qnafilepath+subpath,file));
		          qf.setFilepath(subpath);
		          qf.setFilename2(file.getOriginalFilename());
		      return qf;
	   }
}


	