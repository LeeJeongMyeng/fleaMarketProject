package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req1001_Dao;
import vo.Member;
@Service 
public class Req1001_Service {
	@Autowired
	private Req1001_Dao dao;
	public List<Member> MemberList(Member sch){
		if(sch.getEmail()==null) sch.setEmail("");
		if(sch.getNickname()==null) sch.setNickname("");
		if(sch.getAuthority()==null) sch.setAuthority("");
		if(sch.getAddress()==null) sch.setAddress("");
		return dao.MemberList(sch);
}
}
