<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>�������Ǵ� ������(o.jsp)</h1>

	<%
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>

	<b><%=name%></b>���� ��������
	<b><%=bloodType%></b>���̰�
	���� ������ �������Դϴ�.

	</body>
</html>