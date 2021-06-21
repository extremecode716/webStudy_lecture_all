package oracle.java.s20180102.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GServContentsVo {
	// contents 다중으로 받아오기 위한 변수
	private String[] gservIntro;
	private String[] gservOrder;
	private MultipartFile[] imgfile;
	private String[] imgSrc;
	private String[] introTitle;
	
	// GServi
	private int gservNo;
	private int gno;
	private String gservTitle;
	private String gservGps;
	private String gservLeadTime;
	private String gservSub;
	private String gservArea;
	private int gservPrice;
	private int memSizeMin;
	private int memSizeMax;
	private String gservLang;
	private String servTag;
	private String pinclude;
	private String notPInclude;
	private String caution;
	private String gservSDate;
	private String gservEDate;
	private String gservDay;
	private String days[];
	private Date gservCreDate;
	private Date gservFixDate;
	private String gservLock;
	private String pickUpLoc;
	private String pickUpTime;
	private MultipartFile pickUpImg;

	
	
	public String[] getIntroTitle() {
		return introTitle;
	}
	public void setIntroTitle(String[] introTitle) {
		this.introTitle = introTitle;
	}
	public MultipartFile getPickUpImg() {
		return pickUpImg;
	}
	public void setPickUpImg(MultipartFile pickUpImg) {
		this.pickUpImg = pickUpImg;
	}
	public String[] getGservIntro() {
		return gservIntro;
	}
	public void setGservIntro(String[] gservIntro) {
		this.gservIntro = gservIntro;
	}
	public String[] getGservOrder() {
		return gservOrder;
	}
	public void setGservOrder(String[] gservOrder) {
		this.gservOrder = gservOrder;
	}
	public MultipartFile[] getImgfile() {
		return imgfile;
	}
	public void setImgfile(MultipartFile[] imgfile) {
		this.imgfile = imgfile;
	}
	public String[] getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String[] imgSrc) {
		this.imgSrc = imgSrc;
	}
	public int getGservNo() {
		return gservNo;
	}
	public void setGservNo(int gservNo) {
		this.gservNo = gservNo;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGservTitle() {
		return gservTitle;
	}
	public void setGservTitle(String gservTitle) {
		this.gservTitle = gservTitle;
	}
	public String getGservGps() {
		return gservGps;
	}
	public void setGservGps(String gservGps) {
		this.gservGps = gservGps;
	}
	public String getGservLeadTime() {
		return gservLeadTime;
	}
	public void setGservLeadTime(String gservLeadTime) {
		this.gservLeadTime = gservLeadTime;
	}
	public String getGservSub() {
		return gservSub;
	}
	public void setGservSub(String gservSub) {
		this.gservSub = gservSub;
	}
	public String getGservArea() {
		return gservArea;
	}
	public void setGservArea(String gservArea) {
		this.gservArea = gservArea;
	}
	public int getGservPrice() {
		return gservPrice;
	}
	public void setGservPrice(int gservPrice) {
		this.gservPrice = gservPrice;
	}
	public int getMemSizeMin() {
		return memSizeMin;
	}
	public void setMemSizeMin(int memSizeMin) {
		this.memSizeMin = memSizeMin;
	}
	public int getMemSizeMax() {
		return memSizeMax;
	}
	public void setMemSizeMax(int memSizeMax) {
		this.memSizeMax = memSizeMax;
	}
	public String getGservLang() {
		return gservLang;
	}
	public void setGservLang(String gservLang) {
		this.gservLang = gservLang;
	}
	public String getServTag() {
		return servTag;
	}
	public void setServTag(String servTag) {
		this.servTag = servTag;
	}
	public String getPinclude() {
		return pinclude;
	}
	public void setPinclude(String pinclude) {
		this.pinclude = pinclude;
	}
	public String getNotPInclude() {
		return notPInclude;
	}
	public void setNotPInclude(String notPInclude) {
		this.notPInclude = notPInclude;
	}
	public String getCaution() {
		return caution;
	}
	public void setCaution(String caution) {
		this.caution = caution;
	}
	public String getGservSDate() {
		return gservSDate;
	}
	public void setGservSDate(String gservSDate) {
		this.gservSDate = gservSDate;
	}
	public String getGservEDate() {
		return gservEDate;
	}
	public void setGservEDate(String gservEDate) {
		this.gservEDate = gservEDate;
	}
	public String getGservDay() {
		return gservDay;
	}
	public void setGservDay(String gservDay) {
		this.gservDay = gservDay;
	}
	public String[] getDays() {
		return days;
	}
	public void setDays(String[] days) {
		this.days = days;
	}
	public Date getGservCreDate() {
		return gservCreDate;
	}
	public void setGservCreDate(Date gservCreDate) {
		this.gservCreDate = gservCreDate;
	}
	public Date getGservFixDate() {
		return gservFixDate;
	}
	public void setGservFixDate(Date gservFixDate) {
		this.gservFixDate = gservFixDate;
	}
	public String getGservLock() {
		return gservLock;
	}
	public void setGservLock(String gservLock) {
		this.gservLock = gservLock;
	}
	public String getPickUpLoc() {
		return pickUpLoc;
	}
	public void setPickUpLoc(String pickUpLoc) {
		this.pickUpLoc = pickUpLoc;
	}
	public String getPickUpTime() {
		return pickUpTime;
	}
	public void setPickUpTime(String pickUpTime) {
		this.pickUpTime = pickUpTime;
	}

}
