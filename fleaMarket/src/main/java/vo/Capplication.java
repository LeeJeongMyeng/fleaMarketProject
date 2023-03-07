package vo;

import org.springframework.web.multipart.MultipartFile;
//vo.Capplication
// vo.Capplication
public class Capplication {
	private int communitynumber; //커뮤니티번호
	private String title;	// 제목
	private String content;	// 커뮤니티내용
	private String registDate;	// 등록날짜
	private String updateDate;	// 수정날짜
	private String category;	// 카테고리
	private String categoryDetail;
	private String email;	//이메일
	private String hashtag;	//해시태그
	private int viewCnt;	//조회수
	private String imgname;	//파일명
	private MultipartFile report;	// 
	public int getCommunitynumber() {
		return communitynumber;
	}
	public void setCommunitynumber(int communitynumber) {
		this.communitynumber = communitynumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public String getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(String categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
	
}
