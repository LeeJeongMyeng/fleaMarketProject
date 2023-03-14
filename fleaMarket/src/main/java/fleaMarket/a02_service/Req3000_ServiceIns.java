package fleaMarket.a02_service;

import java.util.Arrays;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req3000_Dao;
import fleaMarket.util.FileService;
import vo.Calendar;
import vo.FFile;
import vo.FleaMarket;
@Service
public class Req3000_ServiceIns implements Req3000_Service{
	
	private Req3000_Dao dao;
	
	@Autowired 
	private FileService fileservice;
	
	  @Value("${fleamarket.upload3}") 
		private String profilepath;
	
	public Req3000_ServiceIns(Req3000_Dao dao) {
		this.dao = dao;
	}
	//캘린더 
	
	   public List<Calendar> calList(){
		      return dao.calList();
		   }
	
	//홍보글 등록
	public void insertFleaMarket(FleaMarket ins){
    	dao.insertFleaMarket(ins);
    }
	
		
	public String insertFleaFileModule(List<MultipartFile> pro) {
		 FFile fins = null;
		 int result=0; 
		 String msg="";
		for(MultipartFile f:pro){
        //HashMap으로 파일이름과 경로를 반환함
       // 이미지 확장자냐에 따른 경로 심기.
          String imgArra[] = {"gif","jpg","jpe","png","bmp","ico","apng","jfif"};    
        
          String subpath = (Arrays.asList(imgArra).indexOf(
          		f.getOriginalFilename().split("\\.")[1])==-1)?"fleafile/":"img/fleaMarket/";
          
        fileservice.insprofileimg(profilepath+subpath, f); 
          
        //등록파일 vo객체에 set값 할당(for문 돌면서 계속 할당)
        fins= new FFile(f.getOriginalFilename(),profilepath+subpath); 
        
        result=dao.insprofile(fins); 
        if(result>=1) {
        	msg="등록 성공";
        }else {
        	msg = "등록 실패";
        }
        // int result == 1 일떼 STRING RESULT = "성공" 
		}
		 return msg;
		}	
		
	//파일처리
	public int insprofile(FFile fins) {
		return dao.insprofile(fins);
	}
		
	//수정페이지 상세 정보 불러오기 
	public FleaMarket fleaDetail(String postingNumber) {
		
		return dao.fleaDetail(postingNumber);
	}    
	
	//수정하기
	public void UptFleaMarket(FleaMarket upt) {
		dao.UptFleaMarket(upt);
	} 
	//파일 수정 
	public void UptFFile(FFile fupt) {
		dao.UptFFile(fupt);
	}  	
	
	//전체조회
	public List<FleaMarket> getFleaMarketList(FleaMarket sch){
		if(sch.getTitle()==null) sch.setTitle("");
		return dao.getFleaMarketList(sch);
	}	
	//전체조회(img 파일)
	public String FileNum(String postingNumber){
		return dao.FileNum(postingNumber);
	}
	
	//삭제하기
	public void delFleaMarket(String postingNumber){
	    dao.delFleaMarket(postingNumber);
	}
	
	//파일 정보파일 불러오기(삭제하기)
	public List<FFile> DelFail(String postingNumber){

	    return  dao.DelFail(postingNumber);
	}

	
	
}
