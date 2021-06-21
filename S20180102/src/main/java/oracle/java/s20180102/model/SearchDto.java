package oracle.java.s20180102.model;

import java.sql.Date;

public class SearchDto {
	private String srch_title;
	private Date srch_date;
	
	
	
	// 검색용 dto
	private String nickName;
	private String servTag = "'%%'";
	private String gservArea;
	private String areaCode = "%";
	private String gservSub;
	private String gservTitle;
	private String gservPrice="%"; 
	private String gservLeadTime ="< 10000";
	private Date gservSDate;
	private Date gservEDate; 
	private String gservDay = "'%%'";
	private String order = "gServCreDate";
	private String memberId="%%";
	private String endDate = "sysdate < gServEDate";
	private String startDate = "sysdate > gServSDate";
	
	//조회용
	private int start;
	private int end;
	
	private String keyword;
	private int gservNo;
	private int call;
	private int hotOrder;

	
	public int getHotOrder() {
		return hotOrder;
	}
	public void setHotOrder(int hotOrder) {
		this.hotOrder = hotOrder;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getGservNo() {
		return gservNo;
	}
	public void setGservNo(int gservNo) {
		this.gservNo = gservNo;
	}
	public int getCall() {
		return call;
	}
	public void setCall(int call) {
		this.call = call;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getSrch_title() {
		return srch_title;
	}
	public void setSrch_title(String srch_title) {
		this.srch_title = srch_title;
	}
	public Date getSrch_date() {
		return srch_date;
	}
	public void setSrch_date(Date srch_date) {
		this.srch_date = srch_date;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getServTag() {
		return servTag;
	}
	public void setServTag(String servTag) {
		this.servTag = servTag;
	}
	public String getGservArea() {
		return gservArea;
	}
	public void setGservArea(String gservArea) {
		this.gservArea = gservArea;
	}
	public String getGservSub() {
		return gservSub;
	}
	public void setGservSub(String gservSub) {
		this.gservSub = gservSub;
	}
	public String getGservTitle() {
		return gservTitle;
	}
	public void setGservTitle(String gservTitle) {
		this.gservTitle = gservTitle;
	}
	public String getGservPrice() {
		return gservPrice;
	}
	public void setGservPrice(String gservPrice) {
		this.gservPrice = gservPrice;
	}
	public String getGservLeadTime() {
		return gservLeadTime;
	}
	public void setGservLeadTime(String gservLeadTime) {
		this.gservLeadTime = gservLeadTime;
	}
	public Date getGservSDate() {
		return gservSDate;
	}
	public void setGservSDate(Date gservSDate) {
		this.gservSDate = gservSDate;
	}
	public Date getGservEDate() {
		return gservEDate;
	}
	public void setGservEDate(Date gservEDate) {
		this.gservEDate = gservEDate;
	}
	public String getGservDay() {
		return gservDay;
	}
	public void setGservDay(String gservDay) {
		this.gservDay = gservDay;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
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

	
}
