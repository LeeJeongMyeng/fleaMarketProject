package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.FMViewDao;
import vo.FleaMarket;

@Service
public class FMViewService {
	@Autowired(required=false)
	private FMViewDao dao;
	public List<FleaMarket> fmList(FleaMarket sch){		
		return dao.fmList(sch);
	}
	
	public FleaMarket getFm(String postingNumber) {
		FleaMarket fm = dao.getFm(postingNumber);
		return fm;
	}	
}
