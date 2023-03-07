package fleaMarket.a02_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.CommunitySelectDao;
import vo.BoardImg;
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
		List<CapplicationList> clist = new ArrayList<CapplicationList>();
		clist = mapper.getCommunityList(cri);
		for(int i = 0;i<clist.size();i++) {
			CapplicationList cap = (CapplicationList)clist.get(i);
			String separate = cap.getImgName();
			//공백처리 
			//System.out.println(separate);
			StringTokenizer st = new StringTokenizer(separate,"&SEP&");
			if(st.hasMoreTokens()) {
				clist.get(i).setImgName(st.nextToken());
			}
		}
		return clist;
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
		List<CapplicationList> clist = new ArrayList<CapplicationList>();
		clist = mapper.getBestCommunityList(cri);
		for(int i = 0;i<clist.size();i++) {
			CapplicationList cap = (CapplicationList)clist.get(i);
			String separate = cap.getImgName();
			//공백처리 
			//System.out.println(separate);
			StringTokenizer st = new StringTokenizer(separate,"&SEP&");
			if(st.hasMoreTokens()) {
				clist.get(i).setImgName(st.nextToken());
			}
			
		}
		
		return clist;
	}
	@Override
	public List<CapplicationList> getCommunityDetailList(String communityNumber) {
		// TODO Auto-generated method stub
		return mapper.getCommunityDetailList(communityNumber);
	}
	@Override
	public List<String> getCommunityImg(String communityNumber) {
		// TODO Auto-generated method stub
		List<BoardImg> clist = new ArrayList<BoardImg>();
		clist = mapper.getCommunityImgList(communityNumber);
		System.out.println(clist.size());
		List<String> slist = new ArrayList<>();
		String separate = "";
		for(int i = 0;i<clist.size();i++) {
			BoardImg img = clist.get(i);
			separate = img.getImgname();
		}
		StringTokenizer st = new StringTokenizer(separate,"&SEP&");
		System.out.println(st.countTokens());
			if(st.countTokens()>=1) {
				int i = 0;
				while(st.hasMoreTokens()) {
					slist.add(i, st.nextToken());
					i++;
				}
			}
		
		return slist;
			
			
		
	}
	@Override
	// int 1, 0 
	public int getFollowYesOrNot(String communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		map.put("communityNumber",communityNumber);
		map.put("email",email);
		return mapper.getFollowYesOrNot(map);
				
	}
	@Override
	public int getInsertFriend(String myEmail, String following) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		map.put("myEmail",myEmail);
		map.put("following",following);
		return mapper.getInsertFriend(map);
	}
	@Override
	public int getDeleteFriend(String myEmail, String following) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		map.put("myEmail",myEmail);
		map.put("following",following);
		return mapper.getDeleteFriend(map);
	}
	@Override
	public int getLikeYesOrNot(String communityNumber, String email) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		map.put("communityNumber",communityNumber);
		map.put("email",email);
		return mapper.getFollowYesOrNot(map);
	}
	
	
	
		
}
