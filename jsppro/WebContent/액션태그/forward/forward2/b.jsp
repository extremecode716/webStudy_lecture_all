<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>�������Ǵ� ������(b.jsp)</h1>

	<%
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>

	<b><%=name%></b>���� ��������
	<b><%=bloodType%></b>���̰� 
	�԰��� �Ⱦ��ϴ� �������Դϴ�.

	</body>
</html>