<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>�������Ǵ� ������(ab.jsp)</h1>

	<%
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>

	<b><%=name%></b>���� ��������
	<b><%=bloodType%></b>���̰�<p>
	��Ȯ�� �Ǵܷ��� ���� �ո��������Դϴ�.

	</body>
</html>
