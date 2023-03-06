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
	
	//수정하기
	public void UptFleaMarket(FleaMarket upt) {
		dao.UptFleaMarket(upt);
	} 

	//삭제하기
	public void delFleaMarket(String postingNumber){
	    dao.delFleaMarket(postingNumber);
	}
	
	//전체조회
	public List<FleaMarket> getFleaMarketList(FleaMarket sch){
		if(sch.getPostingNumber()==null) sch.setPostingNumber("");
		if(sch.getTitle()==null) sch.setTitle("");
		if(sch.getRegistDate()==null) sch.setRegistDate("");
		if(sch.getContent()==null) sch.setContent("");
		if(sch.getBisenessNumber()==null) sch.setBisenessNumber("");
		if(sch.getEmail()==null) sch.setEmail("");
		if(sch.getApprovalMaxCnt()==null) sch.setApprovalMaxCnt("");
		if(sch.getRecruitmentStartDate()==null) sch.setRecruitmentStartDate("");
		if(sch.getRecruitmentEndDate()==null) sch.setRecruitmentEndDate("");
		if(sch.getOpenDate()==null) sch.setOpenDate("");
		if(sch.getCloseDate()==null) sch.setCloseDate("");
		if(sch.getCheckForm()==null) sch.setCheckForm("");
		if(sch.getViewCnt()==0) sch.setViewCnt(0);
		if(sch.getAddress()==null) sch.setAddress("");

		return dao.getFleaMarketList(sch);
	}	
	//전체조회(img 파일)
	public List<FFile> FileNum(FleaMarket sch){
		return dao.FileNum(sch);
	}
	
	
}
