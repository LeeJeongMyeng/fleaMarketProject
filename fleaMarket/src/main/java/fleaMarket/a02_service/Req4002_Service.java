package fleaMarket.a02_service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req4002_Dao;
import vo.BoardImg;
import vo.Capplication;
import vo.FollowMemberInfo;
import vo.RoomMemberInfo;

@Service
public class Req4002_Service {
	@Autowired(required=false)
	private Req4002_Dao dao;
	
	public void communityInsert(Capplication ins) {
		if(ins.getHashtag()==null) ins.setHashtag("");
		dao.communityInsert(ins);
	}
	public void communityFileInsert(BoardImg fIns) {
		dao.communityFileInsert(fIns);
	}
	
	public void communityUpdate(Capplication upt) {
		if(upt.getHashtag()==null) upt.setHashtag("");
		dao.communityUpdate(upt);
	}
	
	public List<FollowMemberInfo> followerSelect(FollowMemberInfo index) {
		if(index.getKeyword()==null) index.setKeyword("");
		if(index.getMyemail()==null) index.setMyemail("");
		return dao.followerSelect(index);
	}
	
	public void followmemberdelete(FollowMemberInfo del) {
		dao.followmemberdelete(del);
	}
	
	public RoomMemberInfo roomMemberInfo(String email){
		return dao.roomMemberInfo(email);
	}
	
	public List<RoomMemberInfo> boardReplySelect(Map<String, String> map) {
		return dao.boardReplySelect(map);
	}
	
	public List<RoomMemberInfo> boardSelect(Map<String, String> map){
		return dao.boardSelect(map);
	}
}
