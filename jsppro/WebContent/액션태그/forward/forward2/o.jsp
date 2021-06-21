<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>포워딩되는 페이지(o.jsp)</h1>

	<%
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>

	<b><%=name%></b>님의 혈액형은
	<b><%=bloodType%></b>형이고
	강한 의지의 소유자입니다.

	</body>
</html>