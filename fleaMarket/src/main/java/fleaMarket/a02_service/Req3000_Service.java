package fleaMarket.a02_service;

import java.util.List;

import org.springframework.stereotype.Service;

import vo.FFile;
import vo.FleaMarket;

@Service
public interface Req3000_Service {
	public void insertFleaMarket(FleaMarket ins);
	public void insprofile(FFile fins);
	public void UptFleaMarket(FleaMarket upt);
	public void delFleaMarket(String postingNumber);
	public List<FleaMarket> getFleaMarketList(FleaMarket sch);	
	public List<FFile> FileNum(FleaMarket sch);
	public List<FleaMarket> calList(); 
}
