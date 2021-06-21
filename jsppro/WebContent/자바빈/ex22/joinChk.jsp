<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="join" class="join.JoinBean"/>
<jsp:setProperty name="join" property="*"/>

<html>
<head>
<title>회원가입 입력 정보 확인 페이지</title>
</head>
<body>
<center>
<table border=1>
	<tr>
		<td bgcolor="yellow"><font size=2>아이디 : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="id"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>비밀번호 : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="pass"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>이름 : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="name"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>성별 : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="sex"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>나이 : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="age"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>이메일주소 : </td>
		<td bgcolor="yellow"><jsp:getProperty name="join" property="email"/></td>
	</tr>
</table>
</center>
</body>
</html>
