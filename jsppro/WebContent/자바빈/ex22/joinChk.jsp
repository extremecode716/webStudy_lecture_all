<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="join" class="join.JoinBean"/>
<jsp:setProperty name="join" property="*"/>

<html>
<head>
<title>ȸ������ �Է� ���� Ȯ�� ������</title>
</head>
<body>
<center>
<table border=1>
	<tr>
		<td bgcolor="yellow"><font size=2>���̵� : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="id"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>��й�ȣ : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="pass"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>�̸� : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="name"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>���� : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="sex"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>���� : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="age"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>�̸����ּ� : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="email"/></td>
	</tr>
</table>
</center>
</body>
</html>
