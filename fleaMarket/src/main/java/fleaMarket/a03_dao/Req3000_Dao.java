package fleaMarket.a03_dao;
import vo.FFile;
//fleaMarket.a03_dao.Req3000_Dao
import vo.FleaMarket;

public interface Req3000_Dao {
    //등록
	public void insertFleaMarket(FleaMarket ins);
	public void insprofile(FFile fins);
	//수정
	public void UptFleaMarket(FleaMarket upt);
}
