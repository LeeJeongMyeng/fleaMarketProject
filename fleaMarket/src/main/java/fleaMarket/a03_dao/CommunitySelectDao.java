package fleaMarket.a03_dao;
import java.util.List;
import java.util.Map;

import vo.BoardImg;
import vo.CapplicationList;
import vo.Criteria;

public interface CommunitySelectDao {
	//커뮤니티 전체 조회 count / 검색 
	public int getCommunitySelectNum(Criteria cri);
	//인기글 개수 
	public int getBestCommunityListNum(Criteria cri);
	//커뮤니티 목록/검색 페이징 적용 
	public List<CapplicationList> getCommunityList(Criteria cri);
	
	//인기글 처리 
	public List<CapplicationList> getBestCommunityList(Criteria cri);
	
	public List<CapplicationList> getCommunityDetailList(int communityNumber);
	//조회수 업데이트 
	public void updateViewCnt(int communityNumber);
	public List<BoardImg> getCommunityImgList(int communityNumber);
	// json 
	public int getFollowYesOrNot(Map<String,Object> map);
	
	public int getInsertFriend(Map<String,String> map);
	
	public int getDeleteFriend(Map<String,String> map);
	//좋아요 // yes or not
	public int getLikeYesOrNot(Map<String,Object> map);
	
	public int getLikeCnt(int communityNumber);
	
	public int getLikeInsert(Map<String,Object> map);
	
	public int getLikeDelete(Map<String,Object> map);
	
	
	
}
