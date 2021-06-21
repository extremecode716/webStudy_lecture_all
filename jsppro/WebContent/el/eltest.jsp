<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String str = "jsptest";

	request.setAttribute("strname", str); // 공유 설정
%> 

str1 = <%=str %> <br>   

str2 = ${str } <br>   		<!--  출력 안됨 -->

str3 = ${strname } <br>

<%
	String s = (String)request.getAttribute("strname");
%>
str4 = <%=s %> <br>
    