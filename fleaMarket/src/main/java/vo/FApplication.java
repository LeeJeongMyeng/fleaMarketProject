package vo;

import java.util.Date;

public class FApplication {
	private String postingNumber;
	private String email;
	private int applicationNo;
	private Date applicationDate;
	private String approvalWhether;
	
	private String title;
	private String nickname;
	
	public String getPostingNumber() {
		return postingNumber;
	}
	public void setPostingNumber(String postingNumber) {
		this.postingNumber = postingNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(int applicationNo) {
		this.applicationNo = applicationNo;
	}
	public Date getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getApprovalWhether() {
		return approvalWhether;
	}
	public void setApprovalWhether(String approvalWhether) {
		this.approvalWhether = approvalWhether;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}