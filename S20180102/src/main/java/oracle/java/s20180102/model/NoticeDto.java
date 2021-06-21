package oracle.java.s20180102.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDto {
	private int noticeNo;
	private String ntitle;
	private String ncontent;
	private String nimg;
	private int nreadCount;
	private Date ncredate;
	
	private MultipartFile[] files; 

	
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNimg() {
		return nimg;
	}
	public void setNimg(String nimg) {
		this.nimg = nimg;
	}
	public int getNreadCount() {
		return nreadCount;
	}
	public void setNreadCount(int nreadCount) {
		this.nreadCount = nreadCount;
	}
	public Date getNcredate() {
		return ncredate;
	}
	public void setNcredate(Date ncredate) {
		this.ncredate = ncredate;
	}
	

}
