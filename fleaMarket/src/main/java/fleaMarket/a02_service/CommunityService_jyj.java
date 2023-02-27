package fleaMarket.a02_service;

import org.springframework.beans.factory.annotation.Autowired;

import fleaMarket.a03_dao.CommunityDao_jyj;
import vo.BoardImg;
import vo.Capplication;

public class CommunityService_jyj {
	@Autowired(required=false)
	private CommunityDao_jyj dao;
	
	public void communityInsert(Capplication ins) {
		dao.communityInsert(ins);
	}
	public void communityFileInsert(BoardImg fins) {
		dao.communityFileInsert(fins);
	}
}
