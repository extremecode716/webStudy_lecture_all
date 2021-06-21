<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>포워딩되는 페이지(b.jsp)</h1>

	<%
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>

	<b><%=name%></b>님의 혈액형은
	<b><%=bloodType%></b>형이고 
	규격을 싫어하는 자유인입니다.

	</body>
</html>