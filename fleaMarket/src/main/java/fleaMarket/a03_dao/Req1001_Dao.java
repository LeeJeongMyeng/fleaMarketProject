package fleaMarket.a03_dao;

import java.util.List;

import vo.FApplicationSch;
import vo.FleaMarket;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;

public interface Req1001_Dao {
	public List<Member> MemberList(Member sch);
	public Member getMember(String nickname);	
	public void UpdateMemberInfo(Member upt);
	public void UpdateProfile(ProfileImg upt);
	public void UpdatePassword(Member upt);
	public Member Login(String email);
	public void DeleteProfile(String email);
	public void DeleteMember(String email);
	public List<FleaMarket> FleaMarketList(String email);
	public List<QNA> MemberQNAList(String email);
	public ProfileImg getMemberProfile(String email);
	public List<QNA> QNAListNotics(); //공지사항 전체 조회
	public int totCnt(FApplicationSch sch);
	public List<QNA> QNAList(FApplicationSch sch);//검색한 문의글 조회
	public QNA getQNA(String qnano);	
	public List<QNAFile> getQNAFile(String qnano);
	//public List<QNAFile> getQNAFileList(String filename);
	
}
