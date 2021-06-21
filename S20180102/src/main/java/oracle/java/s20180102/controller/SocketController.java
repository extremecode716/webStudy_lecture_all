package oracle.java.s20180102.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.s20180102.service.WebSockService;


@Controller
public class SocketController {

	
		@Autowired
		private WebSockService service;
		
		@RequestMapping("chat.do")
		public String chat() {
			System.out.println("일반 chat 시작 ");
			return "chat";
		}
		
		@RequestMapping("adminchat.do")
		public String adminchat() {
			System.out.println("adminchat 시작1");
			return "adminchat";
		}
		
		
		//일반접속후 -현재 입장 인원수 구한 후 리턴
		@RequestMapping("chat_connect.do")
		public void chat_count(HttpServletResponse response )throws Exception{
			System.out.println("일반인 chat_connect -> 1");
			PrintWriter out = response.getWriter();
			int result = service.getCount();
			System.out.println("접속인원수 : "+result);
			
			out.println(result);
		}
		
		//일반인 퇴장		
		@RequestMapping("chat_close.do")
		public void chat_close() {
			System.out.println("퇴장");
			
			int result=service.delCount();
			
			System.out.println("퇴장인원수 =? "+result);
		}
		
		
		//관리자 입장
		@RequestMapping(value="admin_connect.do")
		public void admin_connect(HttpServletResponse response)throws Exception{
			
			System.out.println("admins_connect 시작");
			PrintWriter out =response.getWriter();
			
			int result=service.admin_connect();
			
			System.out.println("admin_connect 관리자 입장 =>" +result);
			System.out.println("cnt ? "+ result);
			
		}
		
		
		//관리자 퇴장
		@RequestMapping("admin_close.do")
		public void admin_close(HttpServletResponse response)throws Exception{
			
			System.out.println("admin_close 들어옴 ");
			
			PrintWriter out=response.getWriter();
			int result=service.initCount();
			
			System.out.println("관리자 퇴장 => "+ result);
		
			out.println(result);
		}
}