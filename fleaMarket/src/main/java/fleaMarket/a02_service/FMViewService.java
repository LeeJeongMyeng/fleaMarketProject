package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.FMViewDao;
import vo.ApplicationFile;
import vo.FApplication;
import vo.FleaMarket;

@Service
public class FMViewService {
	@Autowired(required=false)
	private FMViewDao dao;
	
	// 홍보글 상세 조회
	public FleaMarket fmView(String postingNumber) {
		FleaMarket fm = dao.fmView(postingNumber);
		return fm;
	}	
	
	// 받은 신청 전체 조회(최신순)
	public List<FApplication> appReceivedList(FApplication sch){		
		return dao.appReceivedList(sch);
	}
	// 받은 신청 상세 조회
	public ApplicationFile appReceivedView(int applicationNo) {
		ApplicationFile af = dao.appReceivedView(applicationNo);
		return af;
	}	
	// 받은 신청 승인
	public void updateAppRe(FApplication upt) {
		dao.updateAppRe(upt);
	}
}
