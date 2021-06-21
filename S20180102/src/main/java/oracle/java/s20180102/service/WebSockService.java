package oracle.java.s20180102.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.WebsockDao;



@Service
public class WebSockService {
	
	@Autowired
	private WebsockDao dao;
	
	//인원 구하기
	public int getCount() {
		
		int result=dao.getCount();
		
		return result;
		
	}
	
	//일반인 퇴장
	public int delCount() {
		int result=dao.delCount();
		return result;
	}
	
	public int adminchat() {
		int result=dao.adminchat();
		System.out.println("adminchat S.V 시작3");
		return result;
	}
	
	
	//관리자 입장
	public int admin_connect() {
		int result=dao.admin_connect();
		return result;
		
	}
	
	//일반인 입장
	public int chat_connect() {
		
		int result=dao.chat_connect();
		return result;
	}
	
	public int initCount() {
		int result=dao.initCount();
		return result;
		
	}
	
}