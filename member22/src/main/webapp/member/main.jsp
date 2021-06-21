<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
 	String id = (String) session.getAttribute("id");
if (id == null || id.equals("")) {
	response.sendRedirect("loginForm.jsp");
} else if (id.equals("master")) {
	out.println("관리자 모드!");	
} 

/* String id ="";
if ((String) session.getAttribute("id") != null){
	id = (String) session.getAttribute("id");
if (id.equals("master")) {
out.println("관리자 모드!");	
}
}
else if (session.getAttribute("id") == null) {
	response.sendRedirect("loginForm.jsp");
} */

%>

<body>
	로긴함
	<p>
		정보수정<br>
<%
		if (id != null) {
		if (id.equals("master")) {
%>
		<a href="list.jsp">회원명단</a><br>
<%
		}}
%>
		<a href="logout.jsp">로그아웃</a>
		
</body>
</html>