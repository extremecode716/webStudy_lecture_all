package oracle.java.s20180102.model;

public class PagingDto {
	private String memberId;
	
	private String search;   private String keyword;
	private String pageNum;  
	private int start; 		 private int end;

	/*소희 추가*/
	private String reply_yn;
	private String write_period;
	private String gservTitle;
	private int qaNumber;
	private String qaReceiver;
	private int gno;
	private int gservNo;
	
	private String send_receive;
	private String talker;
	
	
	public String getTalker() {
		return talker;
	}


	public void setTalker(String talker) {
		this.talker = talker;
	}


	public String getSend_receive() {
		return send_receive;
	}


	public void setSend_receive(String send_receive) {
		this.send_receive = send_receive;
	}


	public int getQaNumber() {
		return qaNumber;
	}


	public void setQaNumber(int qaNumber) {
		this.qaNumber = qaNumber;
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


	public String getWrite_period() {
		return write_period;
	}


	public void setWrite_period(String write_period) {
		this.write_period = write_period;
	}

	public String getGservTitle() {
		return gservTitle;
	}


	public void setGservTitle(String gservTitle) {
		this.gservTitle = gservTitle;
	}


	public String getQaReceiver() {
		return qaReceiver;
	}


	public void setQaReceiver(String qaReceiver) {
		this.qaReceiver = qaReceiver;
	}


	public String getReply_yn() {
		return reply_yn;
	}


	public void setReply_yn(String reply_yn) {
		this.reply_yn = reply_yn;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getPageNum() {
		return pageNum;
	}


	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
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

	public void setGno(int gno) {
		this.gno = gno;
	}


}
