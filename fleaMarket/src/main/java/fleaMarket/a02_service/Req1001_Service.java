package fleaMarket.a02_service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.Req1001_Dao;
import vo.FApplicationSch;
import vo.FleaMarket;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;
@Service 
public class Req1001_Service {
	
	@Autowired
	private Req1001_Dao dao;
	
	public List<Member> MemberList(FApplicationSch sch){
		
		if(sch.getTitle()==null) sch.setTitle("");
		if(sch.getSearch()==null) sch.setSearch("전체");
		
		// 1. 총페이지 수
				sch.setCount(dao.totMemCnt(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(5);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		
		
		
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
	public List<FleaMarket> FleaMarketList(FApplicationSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt2(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(10);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		return dao.FleaMarketList(sch);
	}
	public List<QNA> MemberQNAList(FApplicationSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt3(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(10);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		return dao.MemberQNAList(sch);
	}
	public ProfileImg getMemberProfile(String email) {
		return dao.getMemberProfile(email);
	}
	public List<QNA> QNAListNotics(){
		return dao.QNAListNotics();
	}
	public List<QNA> QNAList(FApplicationSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(10);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		return dao.QNAList(sch);
	}
	public QNA getQNA(String qnano) {
		return dao.getQNA(qnano);
		
	}	
	public List<QNAFile> getQNAFile(String qnano) {
		return dao.getQNAFile(qnano);
	}
	/*
	 * public List<QNAFile> getQNAFileList(String filename) { return
	 * dao.getQNAFileList(filename); }
	 */
	
}
