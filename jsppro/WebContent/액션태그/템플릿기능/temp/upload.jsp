<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
	<head><title>�ڷ�� ��</title>
	</head>
	<body>
	<center><h1>�� �� ��</h1></center>
	<table border=1 align=center width=600>
	<form name=myform method=post action=upload.jsp>
		<tr><td>�۾���</td>
			<td><input type=text></td>
		</tr>
		<tr><td>�̸���</td>
			<td><input type=text></td>
		</tr>
		<tr><td>��й�ȣ</td>
			<td><input type=password></td>
		</tr>
		<tr><td>����</td>
			<td><input type=text size=50></td>
		</tr>
		<tr><td>����</td>
			<td><textarea rows=10 cols=55>
				</textarea></td>
		</tr>
		<tr><td>����÷��</td>
			<td>
			<input type=file 
				name=myfile1><br>
			<input type=file				name=myfile2></td>
		</tr>
		<tr><td colspan=2 align=center>
			<input type=submit value="���ۼ�">
			<input type=reset value="�ٽ��ۼ�"></td>
		</tr>
	</form>
	</table>
	</body>
</html>