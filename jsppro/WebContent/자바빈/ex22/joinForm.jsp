<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>ȸ������ ��</title>
</head>
<body>
<center>
<form action="joinChk.jsp" method="post">
<table border=0>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>���̵� : </font></td>
		<td bgcolor="yellow"><input type="text" name="id"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>��й�ȣ : </font></td>
		<td bgcolor="yellow"><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>�̸� : </font></td>
		<td bgcolor="yellow"><input type="text" name="name"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>���� : </font></td>
		<td bgcolor="yellow">
			<input type="radio" name="sex" value="����" checked><font size=2>��</font>
			<input type="radio" name="sex" value="����"><font size=2>��</font>
		</td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>���� : </font></td>
		<td bgcolor="yellow"><input type="text" name="age"></td>
	</tr>
	<tr>
		<td align=right bgcolor="yellow"><font size=2>�̸����ּ� : </font></td>
		<td bgcolor="yellow"><input type="text" name="email"></td>
	</tr>
	<tr>
		<td align=center bgcolor="yellow" colspan=2>
			<input type="submit" value="����">
			<input type="reset" value="�ٽ� �ۼ�">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>
