package fleaMarket.a02_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
		//좋아요 처리 
		//이미지 파일 처리 
		if (clist.size() >= 1) {
			for (int i = 0; i < clist.size(); i++) {
				CapplicationList cap = (CapplicationList) clist.get(i);
				//좋아요 처리
				int likecnt = mapper.getLikeCnt(cap.getCommunitynumber());
				cap.setLikeCnt(likecnt);
				Optional<String> opt = Optional.ofNullable(cap.getImgName());
				String separate = opt.orElse("default_Img.png");
				
				if(separate==null) separate="";
				// 공백처리
				// System.out.println(separate);
				StringTokenizer st = new StringTokenizer(separate, "&SEP&");
				if (st.hasMoreElements()) {
					clist.get(i).setImgName(st.nextToken());
				}
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
		List<CapplicationList> clist = new ArrayList<CapplicationList>();
		
		if(cri.getShift()==null || cri.getShift().equals("1")) {
			cri.setShift("registDate");
		}
		if(cri.getShift().equals("2")) {
			cri.setShift("viewCnt");
		}
		if(cri.getShift().equals("3")) {
			cri.setShift("like");
		}		
		clist = mapper.getBestCommunityList(cri);
		
		if (clist.size() >= 1) {
			for (int i = 0; i < clist.size(); i++) {
				CapplicationList cap = (CapplicationList) clist.get(i);
				int likecnt = mapper.getLikeCnt(cap.getCommunitynumber());
				cap.setLikeCnt(likecnt);
				Optional<String> opt = Optional.ofNullable(cap.getImgName());
				String separate = opt.orElse("default_Img.png");
				// 공백처리
				// System.out.println(separate);
				StringTokenizer st = new StringTokenizer(separate, "&SEP&");
				if (st.hasMoreElements()) {
					clist.get(i).setImgName(st.nextToken());
				}
			}
		}
		return clist;
	
	}
	@Override
	public List<CapplicationList> getCommunityDetailList(int communityNumber) {
		// TODO Auto-generated method stub
	    		
		return mapper.getCommunityDetailList(communityNumber);
	}
	
	@Override
	public List<String> getCommunityImg(int communityNumber) {
		// TODO Auto-generated method stub
		List<BoardImg> clist = new ArrayList<BoardImg>();
		clist = mapper.getCommunityImgList(communityNumber);
		List<String> slist = new ArrayList<>();
		
		for(int i = 0;i<clist.size();i++) {
			BoardImg img = clist.get(i);
			Optional<String> opt = Optional.ofNullable(img.getImgname());
			String separate = opt.orElse("default_Img.png");
			if(img.getImgname()==null) img.setImgname("");
			separate = img.getImgname();
		StringTokenizer st = new StringTokenizer(separate,"&SEP&");
		System.out.println(st.countTokens());
		int s = 0;
			if(st.countTokens()>=1) {
				
				while(st.hasMoreTokens()) {
					slist.add(i, st.nextToken());
					s++;
				}
			}
		}
		return slist;
			
			
		
	}
	@Override
	// int 1, 0 
	public int getFollowYesOrNot(int communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber", communityNumber);
		map.put("session",email);
		return mapper.getFollowYesOrNot(map);
				
	}
	@Override
	public int getInsertFriend(String myEmail, String following) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		if(myEmail==null) myEmail = "";
		map.put("myEmail",myEmail);
		map.put("following",following);
		return mapper.getInsertFriend(map);
	}
	@Override
	public int getDeleteFriend(String myEmail, String following) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		if(myEmail==null) myEmail = "";
		map.put("myEmail",myEmail);
		map.put("following",following);
		return mapper.getDeleteFriend(map);
	}
	@Override
	public int getLikeYesOrNot(int communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber", communityNumber);
		map.put("session",email);
		return mapper.getLikeYesOrNot(map);
	}
	@Override
	public int getLikeCnt(int communityNumber) {
		// TODO Auto-generated method stub	
		return mapper.getLikeCnt(communityNumber);
	}
	@Override
	public String getInsertLike(int communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber",communityNumber);
		map.put("email", email);
		int result = mapper.getLikeInsert(map);
		String msg = "";
		if(result == 1) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		return msg;
	}
	@Override
	public String getDeleteLike(int communityNumber,String email) {
		// TODO Auto-generated method stub\
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber",communityNumber);
		map.put("email", email);
		int result = mapper.getLikeDelete(map);
		String msg = "";
		if(result == 1) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		return msg;		
	}
	@Override
	//조회수 update 
	public void updateViewCnt(int communityNumber) {
		// TODO Auto-generated method stub
		mapper.updateViewCnt(communityNumber);
	}
		
}
