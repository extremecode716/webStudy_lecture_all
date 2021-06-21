<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
MemberDao md = new MemberDao();
int result = md.delete(id);
if (result == 1) {
	%>
	<script type="text/javascript">
	alert("삭제성공");
	location.href="list.jsp";
	</script>
	<%
} else {
	%>
	<script type="text/javascript">
	alert("실패");
	location.href="list.jsp";
	</script>
	<%
}
%>
</body>
</html>