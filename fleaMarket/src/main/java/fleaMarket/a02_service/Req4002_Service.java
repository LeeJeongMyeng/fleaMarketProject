package fleaMarket.a02_service;

import org.springframework.beans.factory.annotation.Autowired;

import fleaMarket.a03_dao.Req4002_Dao;
import vo.BoardImg;
import vo.Capplication;

public class Req4002_Service {
	@Autowired(required=false)
	private Req4002_Dao dao;
	
	public void communityInsert(Capplication ins) {
		dao.communityInsert(ins);
	}
	public void communityFileInsert(BoardImg fins) {
		dao.communityFileInsert(fins);
	}
}
