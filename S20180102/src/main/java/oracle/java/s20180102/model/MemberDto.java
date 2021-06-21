package oracle.java.s20180102.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberDto {
	private String memberId;
	private String nickName;
	private String pw;
	private String tel;
	private String addr;
	private String mname;
	private Date regidate;
	private int mpoint;
	private String authority;
	private String mimg;
	
	// 지영 추가
	private MultipartFile memberImage;
	//-----------------------------
	
	
	public MultipartFile getMemberImage() {
		return memberImage;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public void setMemberImage(MultipartFile memberImage) {
		this.memberImage = memberImage;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}

}
