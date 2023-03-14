package fleaMarket.a02_service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public Capplication boardDetailSelect(int sel) {
		if(dao.boardDetailSelect(sel).getImgname()==null) dao.boardDetailSelect(sel).setImgname("");
		return dao.boardDetailSelect(sel);
	}
	
	public void communityUpdate(Capplication upt) {
		if(upt.getHashtag()==null) upt.setHashtag("");
		dao.communityUpdate(upt);
	}
	
	public void communityFileUpdate(BoardImg fupt) {
		if(fupt.getImgname()==null) fupt.setImgname("");
		dao.communityFileUpdate(fupt);
	}
	
	public List<FollowMemberInfo> followerSelect(FollowMemberInfo index) {
		if(index.getKeyword()==null) index.setKeyword("");
		if(index.getMyemail()==null) index.setMyemail("");
		//if(index.getDiv()==null) index.setDiv("");
		return dao.followerSelect(index);
	}
	
	public void followmemberdelete(FollowMemberInfo del) {
		dao.followmemberdelete(del);
	}
	
	public int boardLikeCnt(String email){
		return dao.boardLikeCnt(email);
	}
	
	public List<RoomMemberInfo> roomMemberInfo(Map<String, String> map){
		return dao.roomMemberInfo(map);
	}
	
	public List<RoomMemberInfo> boardReplySelect(Map<String, String> map) {
		return dao.boardReplySelect(map);
	}
	
	public List<RoomMemberInfo> boardSelect(RoomMemberInfo sel){
		if(sel.getCategory()==null) sel.setCategory("");
		if(sel.getEmail()==null) sel.setEmail("");
		if(sel.getRegistDateMonth()==null) sel.setRegistDateMonth("");
		return dao.boardSelect(sel);
	}
}
