<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
session.invalidate();
%>

<script type="text/javascript">
	alert("로그아웃 됨");
	location.href="loginForm.jsp";
</script>

</body>
</html>