package oracle.java.s20180102.model;

import java.sql.Date;

public class GServDto {
	private int gno;
	private int gservNo;
	private String gservTitle;
	private String gservGps;
	private String gservLeadTime;
	private String gservSub;
	private String gservArea;
	private int gservPrice;
	private int memSizeMin;
	private int memSizeMax;
	private String gservLang;
	private String pickUpLoc;
	private String pickUpTime;
	private String servTag;
	private String pinclude;
	private String notPInclude;
	private String caution;
	private String gservSDate;
	private String gservEDate;
	private String gservDay;
	private Date gservCreDate;
	private Date gservFixDate;
	private String gservLock;
	private String mainView;
	
	// 추가 항목
	
	private int start;
	private int end;
	private String subName;
	private String areaName;
	private int reMemSize;
	private Date tourDate;
	private String endTime;
	private String startSearch;
	private String endSearch;
	//
	
	
	public String getSubName() {
		return subName;
	}
	
	public String getMainView() {
		return mainView;
	}

	public void setMainView(String mainView) {
		this.mainView = mainView;
	}

	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getEndSearch() {
		return endSearch;
	}
	public void setEndSearch(String endSearch) {
		this.endSearch = endSearch;
	}
	public Date getTourDate() {
		return tourDate;
	}	
	public int getReMemSize() {
		return reMemSize;
	}
	public void setReMemSize(int reMemSize) {
		this.reMemSize = reMemSize;
	}
	public void setTourDate(Date tourDate) {
		this.tourDate = tourDate;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getStartSearch() {
		return startSearch;
	}
	public void setStartSearch(String startSearch) {
		this.startSearch = startSearch;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getGservNo() {
		return gservNo;
	}
	public void setGservNo(int gservNo) {
		this.gservNo = gservNo;
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

  
	
}
