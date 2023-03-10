package fleaMarket.a02_service;

import java.util.List;

import org.springframework.stereotype.Service;

import vo.Calendar;
import vo.FFile;
import vo.FleaMarket;

@Service
public interface Req3000_Service {
	public void insertFleaMarket(FleaMarket ins);
	public void insprofile(FFile fins);
	public FleaMarket fleaDetail(String postingNumber);	  
	public void UptFleaMarket(FleaMarket upt);
	public void delFleaMarket(String postingNumber);
	public List<FleaMarket> getFleaMarketList(FleaMarket sch);	
	public String FileNum(String postingNumber);

	/* public List<FleaMarket> calList(Calendar sch); */
	public List<FFile> DelFail(String postingNumber);	
	public void UptFFile(FFile fupt);
}
