<%@ page contentType = "text/html; charset=euc-kr" %>

<html>
	<head><title>ȸ������ �Է� ��</title></head>
	<body>
	
	<form action="register.jsp" method="post">

	<table border="1" cellpadding="0" cellspacing="0">
		<tr><td>���̵�</td>
			<td colspan="3"><input type="text" name="id" size="10"></td>
		</tr>
		<tr><td>�̸�</td>
			<td><input type="text" name="name" size="10"></td>
			<td>�̸���</td>
			<td><input type="text" name="email" size="10"></td>
		</tr>
		<tr><td>�ּ�</td>
			<td colspan="3"><input type="text" name="address" size="30"></td>
		</tr>
		<tr><td colspan="4" align="center">
				<input type="submit" value="ȸ������">
			</td>
		</tr>
	</table>

	</form>

	</body>
</html>