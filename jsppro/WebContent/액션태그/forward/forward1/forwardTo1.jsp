<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>
	<h2>�������Ǵ� ������: forwardTo1.jsp</h2>

	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
	%>

	<b><%=id%></b>����<p>
	�н������ <b><%=password%></b>�Դϴ�.

	<jsp:forward page="forwardTo2.jsp"/>  

	</body>
</html>
