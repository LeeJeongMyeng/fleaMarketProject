package vo;

//신고하기 vo 
public class irregularReportVo {
	private int irrNo;
	private int communityNumber;
	private String email;
	private int irrType;
	private String regDate;
	
	
	public int getIrrNo() {
		return irrNo;
	}
	public int getCommunityNumber() {
		return communityNumber;
	}
	public String getEmail() {
		return email;
	}
	public int getIrrType() {
		return irrType;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setIrrNo(int irrNo) {
		this.irrNo = irrNo;
	}
	public void setCommunityNumber(int communityNumber) {
		this.communityNumber = communityNumber;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setIrrType(int irrType) {
		this.irrType = irrType;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
