package fleaMarket.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req3000_Dao;
import vo.FleaMarket;
@Service
public class Req3000_ServiceIns implements Req3000_Service{
	
	private Req3000_Dao dao;
	@Autowired(required = false)
	public Req3000_ServiceIns(Req3000_Dao dao) {
		this.dao = dao;
	}
	
	
	public void insertFleaMarket(FleaMarket ins){
    	dao.insertFleaMarket(ins);
    }

}
