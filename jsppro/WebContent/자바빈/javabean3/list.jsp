<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="JavaBeanMember.register.LogonDBBean" %>  
<%@ page import="JavaBeanMember.register.LogonDataBean" %>  
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
<a href="registerForm.jsp">ȸ������</a>


<table align=center width=1000 border=1>
	<tr><td>ID</td> 
		<td>��й�ȣ</td>
		<td> �̸� </td>
		<td> �ֹι�ȣ </td>
		<td> �̸��� </td>
		<td> BLOG </td>
		<td> ������ </td>
		<td>����</td>
		<td>����</td>
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
		<td><a href="updateForm.jsp?id=<%=db.getId()%>">����</a></td>
		<td><a href="deleteForm.jsp?id=<%=db.getId()%>">����</a></td>
	</tr>
<% 
	}
%>

</table>
</body>
</html>