<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>회원가입 폼</title>
</head>
<body>
<center>
<form action="joinChk.jsp" method="post">
<table border=0>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>아이디 : </font></td>
		<td bgcolor="yellow"><input type="text" name="id"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>비밀번호 : </font></td>
		<td bgcolor="yellow"><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>이름 : </font></td>
		<td bgcolor="yellow"><input type="text" name="name"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>성별 : </font></td>
		<td bgcolor="yellow">
			<input type="radio" name="sex" value="남자" checked><font size=2>남</font>
			<input type="radio" name="sex" value="여자"><font size=2>여</font>
		</td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>나이 : </font></td>
		<td bgcolor="yellow"><input type="text" name="age"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>이메일주소 : </font></td>
		<td bgcolor="yellow"><input type="text" name="email"></td>
	</tr>
	<tr>
		<td align=center bgcolor="yellow" colspan=2>
			<input type="submit" value="가입">
			<input type="reset" value="다시 작성">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>
