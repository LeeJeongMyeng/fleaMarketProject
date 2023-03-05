package fleaMarket.a02_service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req1001_Dao;
import vo.FleaMarket;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
@Service 
public class Req1001_Service {
	
	@Autowired
	private Req1001_Dao dao;
	
	public List<Member> MemberList(Member sch){
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuthority()==null) sch.setAuthority("전체");
		return dao.MemberList(sch);
}
	public Member getMember(String nickname) {
		return dao.getMember(nickname);
	}
	
	public void UpdateMemberInfo(Member upt){
		dao.UpdateMemberInfo(upt);
	}
	
	public void UpdateProfile(ProfileImg upt) {
		dao.UpdateProfile(upt);
	}
	
	public void UpdatePassword(Member upt) {
		upt.setPassword(BCrypt.hashpw(upt.getPassword(), BCrypt.gensalt()));
		dao.UpdatePassword(upt);
	}
	
	public Member getLogin(String email){
		return dao.Login(email);
	}
	public void DeleteProfile(String email) {
		dao.DeleteProfile(email);
	}
	public void DeleteMember(String email) {
		dao.DeleteMember(email);
	}
	public List<FleaMarket> FleaMarketList(String email){
		return dao.FleaMarketList(email);
	}
	public ProfileImg getMemberProfile(String email) {
		return dao.getMemberProfile(email);
	}
	public List<QNA> QNAList(QNA sch){
		if(sch.getQnano()==null) sch.setQnano("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getTitle()==null) sch.setTitle("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getEmail()==null) sch.setEmail("");
		if(sch.getMethod()==null) sch.setMethod("");
		if(sch.getRegdate()==null) sch.setRegdate("");
		if(sch.getUptdate()==null) sch.setUptdate("");
		return dao.QNAList(sch);
	}
	public QNA getQNA(String qnano) {
		//QNA q = dao.getQNA(qnano);
		// 해당 번호에 파일 정보를 가져오는 처리..
		//b.setFname(dao.getBoardFile(no));
		//q.setQnano(dao.getQNA(qnano));
		return dao.getQNA(qnano);
		
	}	
	
	
}
