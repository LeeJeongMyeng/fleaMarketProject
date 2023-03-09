package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req3000_Dao;
import vo.FFile;
import vo.FleaMarket;
@Service
public class Req3000_ServiceIns implements Req3000_Service{
	
	private Req3000_Dao dao;
	@Autowired(required = false)
	public Req3000_ServiceIns(Req3000_Dao dao) {
		this.dao = dao;
	}
	//캘린더 
	public List<FleaMarket> calList(){
	      return dao.calList();
	   }
	
	//홍보글 등록
	public void insertFleaMarket(FleaMarket ins){
    	dao.insertFleaMarket(ins);
    }
	
	//파일처리
	public void insprofile(FFile fins) {
		dao.insprofile(fins);
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
