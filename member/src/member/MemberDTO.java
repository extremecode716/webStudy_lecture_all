package member;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String jumin1;
	private String jumin2;
	private String mailid;
	private String domain;
	private String tel1;
	private String tel2;
	private String tel3;
	private String phone1;
	private String phone2;
	private String phone3;
	private String post;
	private String address;
	private String gender;
	private String hobby;
	private String intro;
	private Timestamp register;
	
	public String getId() {
		return id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getName() {
		return name;
	}
	public String getJumin1() {
		return jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public String getMailid() {
		return mailid;
	}
	public String getDomain() {
		return domain;
	}
	public String getTel1() {
		return tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public String getPhone1() {
		return phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public String getPost() {
		return post;
	}
	public String getAddress() {
		return address;
	}
	public String getGender() {
		return gender;
	}
	public String getHobby() {
		return hobby;
	}
	public String getIntro() {
		return intro;
	}
	public Timestamp getRegister() {
		return register;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public void setRegister(Timestamp register) {
		this.register = register;
	}
}
