<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>

<%
	// 3. Calendar 클래스
	
	Calendar c = Calendar.getInstance();

	int y = c.get(Calendar.YEAR);			// 년
	int m = c.get(Calendar.MONTH)+1;		// 월 (0 ~ 11)
	int d = c.get(Calendar.DATE);			// 일
	
	int h1 = c.get(Calendar.HOUR);			// 12시간제
	int h2 = c.get(Calendar.HOUR_OF_DAY);	// 24시간제

	String h = "";
	if(c.get(Calendar.AM_PM)==0){			// AM_PM : 0 (오전)
		h = "오전";							// AM_PM : 1 (오후)
	}else{
		h = "오후";
	}
	
	int mm = c.get(Calendar.MINUTE);		// 분
	int s = c.get(Calendar.SECOND);			// 초
	
	// 일(1),월(2),화(3),수(4),목(5),금(6),토(7)
	int week = c.get(Calendar.DAY_OF_WEEK);	// 요일(1~7)
	
	String[] weekend = {"일","월","화","수","목","금","토"};
%>  
<%=week %> <br> <!-- 3 : 화 -->

<%=y %>-<%=m %>-<%=d %> <%=h %> <%=h1 %>:<%=mm %>:<%=s %> 
<%=weekend[week-1] %>요일 <br>

<%=y %>-<%=m %>-<%=d %> <%=h2 %>:<%=mm %>:<%=s %> 
<%=weekend[week-1] %>요일 <br>



