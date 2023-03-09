package fleaMarket.a01_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a02_service.Req4002_Service;
import fleaMarket.util.FileService;
import vo.BoardImg;
import vo.Capplication;
import vo.FollowMemberInfo;
import vo.RoomMemberInfo;

@Controller
public class Req4002_Controller {
	@Autowired(required=false)
	Req4002_Service service;
	
	// 파일 업로드 import
	@Autowired
	private FileService fileservice;
	
	
	// 파일경로
	@Value("${board.upload2}")
	private String upload;
	
	// 파일 업로드하기 기능메서드
	public String multifileFun(MultipartFile[] mfiles) {
		ArrayList<String> imgNames = new ArrayList<String>();
		for (MultipartFile mf : mfiles) {
			System.out.println(mf.toString());
			imgNames.add(fileservice.insprofileimg(upload, mf));
		}
		imgNames.add(""); // 배열 고정값 7 (6개의 파일이 for문을 돌지않아서)
		int inCnt = imgNames.indexOf(""); // 들어오는 이미지 갯수
//		System.out.println(imgNames);
//		System.out.println("사이즈"+imgNames.size());
//		System.out.println("인덱스"+inCnt); // 넣은 숫자값+1
		if(inCnt==0) {
			inCnt = 1;
		}
		String imgnameVal="";
		for(int i=0;i<(inCnt+1);i++) {
			imgnameVal += imgNames.get(i);
			if(i<inCnt) { //이미지 들어온값까지만 구분자 추가
				imgnameVal += "&SEP&";
			}
		}
		return (imgnameVal.substring(0,imgnameVal.length()-5));
	}
	@RequestMapping("communityInsertPage.do")
	public String communityInsertPage() {
		return "communityInsert";
	}
	
	@PostMapping("communityInsert.do")
	public String communityInsert(@RequestParam("mediaFile") MultipartFile[] mfiles,Capplication ins, Model d) {
		service.communityInsert(ins);
		BoardImg f = new BoardImg();
		if( mfiles!=null ){
			//System.out.println("파일 길이:"+mfiles.length);
			f.setImgname(multifileFun(mfiles)); //끝에 구분자제거해서 생성자에 추가
			f.setImgpath(upload);
			service.communityFileInsert(f);
		}
		d.addAttribute("msg", "등록 성공");
		return "redirect/:CommunityList.do?category="+ins.getCategory(); // 전체조회페이지로 이동
	}
	
	@RequestMapping("communityUpdatePage.do")
	public String communityUpdatePage(Model d) {
		Capplication boardInfoVo = service.boardDetailSelect(76);
		
		ArrayList<String> boardArr = new ArrayList<String>(); // 동적 배열
		//String[] dataArr = boardInfoVo.getImgname().split("&SEP&"); // 구분자로 나눠서 배열에 넣기
		
		if(boardInfoVo.getFileNameList()!=null) {
			for (String imgname:boardInfoVo.getFileNameList()) {
				System.out.println("사진명:"+imgname);
				boardArr.add(imgname);
			}
			d.addAttribute("boardImgArr", boardArr);
		}
		
		boardArr.indexOf("");
		d.addAttribute("boardInfo", boardInfoVo);
		return "communityUpdate";
	}
	
	
	@PostMapping("communityUpdate.do")
	public String communityUpdate(@RequestParam("updateFile") MultipartFile[] mfiles,Capplication upt, Model d) {
		service.communityUpdate(upt); // text형들 수정
		
		// 등록되어있는 사진명배열
		Capplication imgname = service.boardDetailSelect(76);
		ArrayList<String> regFileName = new ArrayList<String>();
		
		System.out.println("## 등록되어있는 사진 호출 ##");
		for(String ri:imgname.getFileNameList()) {
			regFileName.add(ri);
			System.out.println(ri);
		}
		
		// 수정한 파일명 배열
		String[] inputfileArr = multifileFun(mfiles).split("&SEP&"); 
		ArrayList<String> inputfileList = new ArrayList<String>(); // 수정파일명 리스트 
		
		System.out.println("## 수정으로 들어간 사진 호출 ##");
		for(String ili:inputfileArr) {
			inputfileList.add(ili);
			System.out.println(ili);
		}
		
		ArrayList<String> uptFileName = new ArrayList<String>(); // (같은파일체크)수정 파일
		
		String uptFname = "";
		for(String ii:regFileName) {
			if(regFileName.indexOf(ii)>=1) {
				uptFileName.add(ii);
			}else {
				for(int i=0;i<inputfileList.size();i++) {
					uptFileName.add(inputfileList.get(i));
					
					uptFname += uptFileName.get(i);
					if(i<uptFileName.size()) { //이미지 들어온값까지만 구분자 추가
						uptFname += "&SEP&";
					}
				}
			}
		}
		System.out.println("## 최종수정본");
		System.out.println(uptFname);
		BoardImg f = new BoardImg();
		if( mfiles!=null ){
			f.setImgname(uptFname.substring(0,uptFname.length()-5)); // 파일명 리턴해옴.
			f.setCommunitynumber(76);
			service.communityFileUpdate(f); //이미지
		}
		d.addAttribute("msg", "수정 성공");
		return "communityUpdate"; // 상세조회페이지로 이동
	}
	
	@RequestMapping("chatting.do")
	public String chatting() {
		return "communityChatAll";
	}
	
	@RequestMapping("communityFollowMember.do")
	public String communityFollowMember(FollowMemberInfo sel, Model d,HttpSession session) {
		session.getAttribute("Login");
		d.addAttribute("follower", service.followerSelect(sel));
		// System.out.println(service.followerSelect(sel));
		return "communityFollowMember";
	}
	
	@RequestMapping("communityFollowDelete.do")
	public String communityFollowDelete(FollowMemberInfo del, Model d) {
		service.followmemberdelete(del);
		return "communityFollowMember";
	}
	
	@RequestMapping("communityMemberRoom.do")
	public String communityMemberRoom(@RequestParam("email") String email,FollowMemberInfo sel,
			RoomMemberInfo board,Model d) {
		
		// 이메일 정보
		d.addAttribute("roommember", service.roomMemberInfo(email));
		
		// 팔로우 정보
		sel.setMyemail(email);
		d.addAttribute("follower", service.followerSelect(sel));
		// 팔로잉 정보
		// https://mititch.tistory.com/77
		// 정보은닉이 안되어(캡슐화X), 좋지않은코드.. 객체에 직접 데이터 넣기.. Map<String, String> 파라미터명이나, 매퍼 나누기
		FollowMemberInfo following = new FollowMemberInfo();
		following.setMyemail(email);
		following.setDiv("팔로잉");
		d.addAttribute("following", service.followerSelect(following));
		
		Map<String, String> repMap = new HashMap<String, String>();
		repMap.put("email", email);
		
		// 나의 게시판 정보
		repMap.put("div", "meboard");
		d.addAttribute("boardreplyInfo", service.boardReplySelect(repMap));
		
		// 나의 댓글 정보
		repMap.put("div", "mereply");
		d.addAttribute("replyInfo", service.boardReplySelect(repMap));
		
		// 카테고리별 게시판 조회
		 Map<String, String> boardMap = new HashMap<String, String>();
		 boardMap.put("email", email);
		 boardMap.put("category", null);
		
		// 좋아요 누적처리 및 커뮤니티 정보
		int totlike=0;
		for(RoomMemberInfo e:service.boardSelect(boardMap)) {
			totlike += e.getLikecnt();
			System.out.println("좋아요수:"+e.getLikecnt());
			System.out.println("전체좋아요수:"+totlike);
		}
		d.addAttribute("boardInfo", service.boardSelect(boardMap));
		d.addAttribute("likeCnt", totlike);
		
		boardMap.put("category", "홍보글");
		d.addAttribute("adv", service.boardSelect(boardMap));
		
		boardMap.put("category", "사업아이디어");
		d.addAttribute("idea", service.boardSelect(boardMap));
		
		boardMap.put("category", "사는이야기");
		d.addAttribute("life", service.boardSelect(boardMap));
		
		boardMap.put("category", "꿀팁");
		d.addAttribute("tip", service.boardSelect(boardMap)); 
		
		return "communityMemberRoom";
	}
	
	
}
