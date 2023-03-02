package fleaMarket.a02_service;

import org.springframework.stereotype.Service;

import vo.FFile;
import vo.FleaMarket;

@Service
public interface Req3000_Service {
	public void insertFleaMarket(FleaMarket ins);
	public void insprofile(FFile fins);
	public void UptFleaMarket(FleaMarket upt);
}
