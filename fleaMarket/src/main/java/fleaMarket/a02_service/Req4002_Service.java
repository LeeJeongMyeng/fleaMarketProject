package fleaMarket.a02_service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req4002_Dao;
import vo.BoardImg;
import vo.Capplication;

public class Req4002_Service {
	@Autowired(required=false)
	private Req4002_Dao dao;
	
	@Value("${board.upload2}")
	private String upload;

	private void uploadFile(MultipartFile f){
		String fname = f.getOriginalFilename();
		File fObj = new File(upload+fname);
		try{
			System.out.println("## 파일 업로드 처리:"+upload+fname);
			f.transferTo(fObj);
		}catch(Exception e){
				System.out.println("업로드예외:"+e.getMessage());
		}			
	}
	public void communityInsert(Capplication ins) {
		dao.communityInsert(ins);
		String fname = ins.getReport().getOriginalFilename();
		if( !fname.equals("") ){
			uploadFile(ins.getReport());
			BoardImg f = new BoardImg();
			f.setImgname(fname);
			f.setImgpath(ins.getTitle());
			dao.communityFileInsert(f);
		}
	}
}