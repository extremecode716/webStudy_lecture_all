<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
%>    

작성자 : <%=writer %> <br>    
제목 : <%=subject %> <br>    
내용 : <pre><%=content %></pre> <br>    