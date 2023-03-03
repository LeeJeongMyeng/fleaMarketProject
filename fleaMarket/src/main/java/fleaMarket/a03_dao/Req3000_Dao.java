package fleaMarket.a03_dao;
import java.util.List;

import vo.FFile;
//fleaMarket.a03_dao.Req3000_Dao
import vo.FleaMarket;

public interface Req3000_Dao {
    //등록
	public void insertFleaMarket(FleaMarket ins);
	public void insprofile(FFile fins);
	
	//수정
	public void UptFleaMarket(FleaMarket upt);
	
	//삭제
	public void delFleaMarket(String postingNumber);
	
	//전체조회
	public List<FleaMarket> getFleaMarketList(FleaMarket sch);	
}
