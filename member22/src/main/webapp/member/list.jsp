<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

회원 명단
<table><tr><th>아이디<th>비밀번호</th><th>수정</th><th>삭제</th></tr>

<%
	MemberDao md = new MemberDao();
	List<Member> list = md.list();
	
for (int i = 0;i<list.size();i++){
%>
	<tr><td><%=list.get(i).getId() %></td><td><%=list.get(i).getPassword() %></td>
	<td><input type="button" value="수정" onclick='location.href="updateForm.jsp?id=<%=list.get(i).getId() %>"'></td>
	<td><input type="button" value="삭제" onclick='location.href="delete.jsp?id=<%=list.get(i).getId() %>"'></td></tr>
<%
}
%>
</table>

<a href="main.jsp">메인으로</a>

</body>
</html>