<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>���� ��� ����</title>
</head>
<body>

	<%
	String id = "guardian23";
	String passwd = "1234";

	session.setAttribute("id", id);
	session.setAttribute("passwd", passwd);
	%>

	���ǿ� id �� passwd �Ӽ��� �����Ͽ����ϴ�.
	<br>
	<br>

	<input type="button" value="������ ������ �Ӽ�Ȯ��" onclick="javascript:window.location='viewSession.jsp'">
</body>
</html>