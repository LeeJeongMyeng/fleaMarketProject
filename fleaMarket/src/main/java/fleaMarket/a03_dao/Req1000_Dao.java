package fleaMarket.a03_dao;

import java.util.HashMap;

import vo.Member;
import vo.ProfileImg;

public interface Req1000_Dao {
	public Member DuplicateEmail(String email);
	public Member DuplicateMem(HashMap<String,String> map);
	public void SignUp(Member ins);
	public void insprofile(ProfileImg fins);
}
