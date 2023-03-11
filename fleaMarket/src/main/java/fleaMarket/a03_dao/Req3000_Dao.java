package fleaMarket.a03_dao;
import java.util.List;

import vo.Calendar;
import vo.FFile;
//fleaMarket.a03_dao.Req3000_Dao
import vo.FleaMarket;

public interface Req3000_Dao {
    //등록
	public void insertFleaMarket(FleaMarket ins);
	public void insprofile(FFile fins);
	
	//캘린더
	/* public List<FleaMarket> calList(Calendar sch); */
	
	//수정페이지 정보 불러오기
	public FleaMarket fleaDetail(String postingNumber);	  
	//수정
	public void UptFleaMarket(FleaMarket upt);
	
	//파일 수정
		public void UptFFile(FFile fupt);
	//전체조회
	public List<FleaMarket> getFleaMarketList(FleaMarket sch);	
	
	//전체조회(img파일) 
	public String FileNum(String postingNumber);
	
	//삭제
	public void delFleaMarket(String postingNumber);
	
	//파일 정보 불러오기(삭제) 
	public List<FFile> DelFail(String postingNumber);
	
	
}
