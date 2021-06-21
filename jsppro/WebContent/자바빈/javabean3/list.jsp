<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="JavaBeanMember.register.LogonDBBean" %>  
<%@ page import="JavaBeanMember.register.LogonDataBean" %>  
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 목록</title>
</head>
<body>
<a href="registerForm.jsp">회원가입</a>


<table align=center width=1000 border=1>
	<tr><td>ID</td> 
		<td>비밀번호</td>
		<td> 이름 </td>
		<td> 주민번호 </td>
		<td> 이메일 </td>
		<td> BLOG </td>
		<td> 가입일 </td>
		<td>수정</td>
		<td>삭제</td>
	</tr>

<%
LogonDBBean manager = LogonDBBean.getInstance();
List<LogonDataBean> li = manager.selectMember();


	for(int i = 0; i < li.size(); i++) {
		LogonDataBean db = (LogonDataBean)li.get(i);
%>

	<tr><td><%=db.getId()%></td>
		<td><%=db.getPasswd()%></td>
		<td><%=db.getName()%></td>
		<td><%=db.getJumin1()%> - <%=db.getJumin2()%> </td>
		<td><%=db.getEmail()%></td>
		<td><%=db.getBlog()%></td>
		<td><%=db.getReg_date()%></td>
		<td><a href="updateForm.jsp?id=<%=db.getId()%>">수정</a></td>
		<td><a href="deleteForm.jsp?id=<%=db.getId()%>">삭제</a></td>
	</tr>
<% 
	}
%>

</table>
</body>
</html>