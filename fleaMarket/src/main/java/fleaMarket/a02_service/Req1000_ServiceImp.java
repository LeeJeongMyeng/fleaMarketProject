package fleaMarket.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req1000_Dao;
import vo.Member;

@Service
public class Req1000_ServiceImp implements Req1000_Service {
	private Req1000_Dao dao;
	@Autowired
	public Req1000_ServiceImp(Req1000_Dao dao) {
		this.dao = dao;
	}
	
	public Member DuplicateEmail(String email) {
		return dao.DuplicateEmail(email);
	}
}
