package fleaMarket.a03_dao;

import java.util.List;
import java.util.Map;

import vo.BoardImg;
import vo.Capplication;
import vo.FollowMemberInfo;
import vo.RoomMemberInfo;

//fleaMarket.a03_dao.CommunityDao_jyj
public interface Req4002_Dao {
	// 커뮤니티 글 등록
	public void communityInsert(Capplication ins);
	// 커뮤니티 파일 등록
	public void communityFileInsert(BoardImg fIns);
	// 커뮤니티 글 수정
	public void communityUpdate(Capplication ins);
	// 팔로우 조회
	public List<FollowMemberInfo> followerSelect(FollowMemberInfo index);
	// 팔로우 취소
	public void followmemberdelete(FollowMemberInfo del);
	// 룸회원 정보 조회
	public RoomMemberInfo roomMemberInfo(String email);
	// 룸회원 댓글 조회
	public List<RoomMemberInfo> boardReplySelect(Map<String, String> map);
	// 커뮤니티 조회(전체, 카테고리별)
	public List<RoomMemberInfo> boardSelect(Map<String, String> map);
}
