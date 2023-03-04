package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.CommunitySelectDao;
import vo.CapplicationList;
import vo.Criteria;



@Service
public class CommunitySelectServiceImpl implements CommunitySelectService {
	
	private CommunitySelectDao mapper;	
	/**
	 * @param dao
	 * 생성자 주입 
	 */
	@Autowired
	public CommunitySelectServiceImpl(CommunitySelectDao mapper) {
		this.mapper = mapper;
	}
	// 페이징 처리를 위한 전체 게시물 갯수
	@Override
	public int getCommunitySelectNum(Criteria cri) {
		// TODO Auto-generated method stub	
		return mapper.getCommunitySelectNum(cri);
	}
	// 페이징 쿼리 적용한 게시물 리스트 
	public List<CapplicationList> getCommunityList(Criteria cri) {
		// TODO Auto-generated method stub
		//service에서 set을 통해 정렬 된 리스트를 받아올 수 있게 비즈니스 로직 처리
		if(cri.getShift()==null || cri.getShift().equals("1")) {
			cri.setShift("registDate");
		}
		if(cri.getShift().equals("2")) {
			cri.setShift("viewCnt");
		}
		if(cri.getShift().equals("3")) {
			cri.setShift("like");
		}		
		//게시판 카테고리 비즈니스 로직 설정
		return mapper.getCommunityList(cri);
	}
	@Override
	public int getCommunityBestCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getBestCommunityListNum(cri);
	}
	@Override
	public List<CapplicationList> getCommunityBestList(Criteria cri) {
		// TODO Auto-generated method stub
		if(cri.getShift()==null || cri.getShift().equals("1")) {
			cri.setShift("registDate");
		}
		if(cri.getShift().equals("2")) {
			cri.setShift("viewCnt");
		}
		if(cri.getShift().equals("3")) {
			cri.setShift("like");
		}		
		
		return mapper.getBestCommunityList(cri);
	}
	
		
}
