package oracle.java.s20180102.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDto {
	private String memberId;
	private int gservNo;
	private String nickName;
	private String rtitle;
	private String rcontent;
	private String rimg;
	private int rstar;
	private int rhit;
	private int rgroup;
	private int rstep;
	private int rindent;
	private Date rcredate;
	
	
	//--- 지영 추가
	private String payCode;
	private String gservTitle;
	private MultipartFile[] images;
	private String[] rimgs;
	//-------------
	
	
	public String getMemberId() {
		return memberId;
	}
	public String[] getRimgs() {
		return rimgs;
	}
	public void setRimgs(String[] rimgs) {
		this.rimgs = rimgs;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getGservNo() {
		return gservNo;
	}
	public void setGservNo(int gservNo) {
		this.gservNo = gservNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRimg() {
		return rimg;
	}
	public void setRimg(String rimg) {
		this.rimg = rimg;
	}
	public int getRstar() {
		return rstar;
	}
	public void setRstar(int rstar) {
		this.rstar = rstar;
	}
	public int getRhit() {
		return rhit;
	}
	public void setRhit(int rhit) {
		this.rhit = rhit;
	}
	public int getRgroup() {
		return rgroup;
	}
	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}
	public int getRstep() {
		return rstep;
	}
	public void setRstep(int rstep) {
		this.rstep = rstep;
	}
	public int getRindent() {
		return rindent;
	}
	public void setRindent(int rindent) {
		this.rindent = rindent;
	}
	public Date getRcredate() {
		return rcredate;
	}
	public void setRcredate(Date rcredate) {
		this.rcredate = rcredate;
	}
	public MultipartFile[] getImages() {
		return images;
	}
	public void setImages(MultipartFile[] images) {
		this.images = images;
	}
	public String getGservTitle() {
		return gservTitle;
	}
	public void setGservTitle(String gservTitle) {
		this.gservTitle = gservTitle;
	}

	
	
	

	
	
}
