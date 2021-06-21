<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>

<%
	// 난수 발생
	Random r = new Random();

	int r1 = r.nextInt(10);		// 0 ~9
	
	// 1 ~ 45 사이의 난수 발생
	int r2 = r.nextInt(45) + 1;
%>    

난수1 : <%=r1%> <br>
난수2 : <%=r2%> <br>