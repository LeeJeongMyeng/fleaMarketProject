package fleaMarket.a02_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 홍보글 상세 조회 이미지파일, 양식파일 분리
	public Map<String,Object> devideFmFile(String postingNumber){
		HashMap<String,Object> map = new HashMap<String,Object>();
		//db에서 뽑아온 파일
		//dao.파일불러오는거
		
		//받아올때, vo객체에 담지말고 List<String>에다가 담아오세요.
		List<String> ffiles = dao.fmFileView(postingNumber);
		//String dbfiles[] = {"a.jpg","b.bmp","c.png","d.ico","e.apng","f.jfif","g.txt","aa.pdf","bb.ppt","cc.doc","gg.hwp"};
		//검사할 확장자
		String imgArray[] = {"gif","jpg","jpeg","png","bmp","ico","apng","jfif"};
		
		//이미지리스트
		List<String> imgfiles = new ArrayList<>();
		//no이미지리스트
		List<String> noimgfiles = new ArrayList<>();
		
		for(String f:ffiles) {
			//1. 들어온 파일이름을 split("\\.")으로자르고 [1] 값을 가져온다.
		String splita = f.split("\\.")[1]; //확장자
		//System.out.println(splita);
		 boolean check = false;
		 
			for(String a:imgArray) {if(splita.equals(a)) {check=true;}}
			//만약 이미지 확장자검사와 일치하는게 있다면,
			System.out.println(check);
			if(check) {imgfiles.add(f);}else {noimgfiles.add(f);}
		}
		map.put("imgfiles", imgfiles);
		map.put("noimgfiles", noimgfiles);  //여기까지에서 map에는 imgfiles의 이름으로 이미지파일리스트, noimgfiles의 이름으로 아닌파일리스트

		return map;
		
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
