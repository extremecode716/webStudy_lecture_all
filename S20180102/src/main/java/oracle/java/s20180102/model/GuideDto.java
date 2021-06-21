package oracle.java.s20180102.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GuideDto {
	private String memberId;
	private int gno;
	private String gimg;
	private String gtel;
	private String kakaoId;
	private String ginfo;
	private String gpage;
	private Date gcredate;
	private String gaccount;
	private int ggrade;
	private int totalCost;
	
	// 지영 추가
	private MultipartFile guideImg;
	private int avgRStar;
	private int cntReview;
	private String nickName;
	//--------------------------------------------
	private String gbank;
	
	
	public String getGbank() {
		return gbank;
	}

	public void setGbank(String gbank) {
		this.gbank = gbank;
	}

	public MultipartFile getGuideImg() {
		return guideImg;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getAvgRStar() {
		return avgRStar;
	}
	public void setAvgRStar(int avgRStar) {
		this.avgRStar = avgRStar;
	}
	public int getCntReview() {
		return cntReview;
	}
	public void setCntReview(int cntReview) {
		this.cntReview = cntReview;
	}
	public void setGuideImg(MultipartFile guideImg) {
		this.guideImg = guideImg;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public int getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGimg() {
		return gimg;
	}
	public void setGimg(String gimg) {
		this.gimg = gimg;
	}
	public String getGtel() {
		return gtel;
	}
	public void setGtel(String gtel) {
		this.gtel = gtel;
	}
	public String getGinfo() {
		return ginfo;
	}
	public void setGinfo(String ginfo) {
		this.ginfo = ginfo;
	}
	public String getGpage() {
		return gpage;
	}
	public void setGpage(String gpage) {
		this.gpage = gpage;
	}
	public Date getGcredate() {
		return gcredate;
	}
	public void setGcredate(Date gcredate) {
		this.gcredate = gcredate;
	}
	public String getGaccount() {
		return gaccount;
	}
	public void setGaccount(String gaccount) {
		this.gaccount = gaccount;
	}
	public int getGgrade() {
		return ggrade;
	}
	public void setGgrade(int ggrade) {
		this.ggrade = ggrade;
	}
	
}
