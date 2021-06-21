<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
%>

<table border=1 align="center" width=500>
	<tr><td>작성자</td>
		<td><%=writer %></td>
	</tr>
	<tr><td>비밀번호</td>
		<td><%=passwd %></td>
	</tr>
	<tr><td>제목</td>
		<td><%=subject %></td>
	</tr>
	<tr><td>내용</td>
		<td><pre><%=content %></pre></td>
	</tr>
</table>


