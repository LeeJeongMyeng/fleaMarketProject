package fleaMarket.a02_service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import vo.Capplication;
import vo.CapplicationList;
import vo.Criteria;

@Service
public interface CommunitySelectService {
	//조회 처리 
	//커뮤니티 게시물 개수(전체)
	 public int getCommunitySelectNum(Criteria cri);
	 
	 public List<CapplicationList> getCommunityList(Criteria cri) throws IOException;
	 
	 //best 게시물 개수 
	 public int getCommunityBestCount(Criteria cri);
	 
	 public List<CapplicationList> getCommunityBestList(Criteria cri);
	 
	 public List<CapplicationList> getCommunityDetailList(int communityNumber);
	 
	 public List<String> getCommunityImg(int communityNumber);
	 
	 //팔로우/팔로잉 count  // myEmail 세션값, -> 팔로잉 목록 조회 
	 public int getFollowYesOrNot(int communityNumber,String email);
	 //팔로우 insert
	 public int getInsertFriend(String myEmail,String following);
	 //팔로우 delete
	 public int getDeleteFriend(String myEmail,String following);
	 //
	 public int getLikeYesOrNot(int communityNumber,String email);
	 //좋아요 수 
	 public int getLikeCnt(int communityNumber);
	 //좋아요 insert
	 public String getInsertLike(int communityNumber,String email);
	 //좋아요 delete
	 public String getDeleteLike(int communityNumber,String email);
	
	 //조회수 
	 public void updateViewCnt(int communityNumber);
}
