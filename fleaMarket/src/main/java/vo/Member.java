package vo;

public class Member {
	private String email;
	private String password;
	private String nickname;
	private String personalnumber;
	private String phoneNumber;
	private String address;
	private String authority;
	private String businessNumber;
	private String kakaoemail;
	private String naveremail;
	private String category;
	private String name;
	public Member() {
	}
	public Member(String email, String password, String nickname, String personalnumber, String phoneNumber,
			String address, String authority, String businessNumber, String kakaoemail, String naveremail,
			String category, String name) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.personalnumber = personalnumber;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.authority = authority;
		this.businessNumber = businessNumber;
		this.kakaoemail = kakaoemail;
		this.naveremail = naveremail;
		this.category = category;
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPersonalnumber() {
		return personalnumber;
	}
	public void setPersonalnumber(String personalnumber) {
		this.personalnumber = personalnumber;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getKakaoemail() {
		return kakaoemail;
	}
	public void setKakaoemail(String kakaoemail) {
		this.kakaoemail = kakaoemail;
	}
	public String getNaveremail() {
		return naveremail;
	}
	public void setNaveremail(String naveremail) {
		this.naveremail = naveremail;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
