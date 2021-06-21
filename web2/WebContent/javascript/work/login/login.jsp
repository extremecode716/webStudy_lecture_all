<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 변수에 받아온 값(name)을 저장 */
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
%>


<!-- jsp에 내장객체 4개가 존재. -->
<!-- request객체가 파라미터를 받아서 표현식으로 출력 -->
ID : <%=request.getParameter("id") %> <br>
비밀번호 : <%=request.getParameter("passwd") %> <br> 