package fleaMarket.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.FMViewDao;
import vo.ApplicationFile;
import vo.FApplication;
import vo.FApplicationSch;
import vo.FleaMarket;

@Service
public class FMViewService {
	@Autowired(required=false)
	private FMViewDao dao;
	
	// 홍보글 상세 조회
	public FleaMarket fmView(String postingNumber) {
		FleaMarket fm = dao.fmView(postingNumber);
		return fm;
	}	
	
	// 신청글 + 파일첨부 등록
	public void insApp(FApplication ins) {
		dao.insApp(ins);
	}		
	public void insUploadFile(ApplicationFile f) {
		dao.insUploadFile(f);
	}

	// 받은 신청 전체 조회(최신순)
	public List<FApplication> appReceivedList(FApplicationSch sch){		
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
		sch.setBlockSize(3);
		
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
		// 검색된 내용 없을 때 처리
		if(((blocknum-1)*sch.getBlockSize()+1)<0) {
			sch.setStartBlock(0);
		}
		
		return dao.appReceivedList(sch);
	}
	/*
	// 받은 신청 상세 조회
	public ApplicationFile appReceivedView(int applicationNo) {
		ApplicationFile af = dao.appReceivedView(applicationNo);
		return af;
	}	
	// 받은 신청 승인
	public void updateAppRe(FApplication upt) {
		dao.updateAppRe(upt);
	}
	*/
}
