<%@ page contentType="text/html;charset=euc-kr"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<h2>includeMain2.jsp ������ �Դϴ�</h2>

	<%
	request.setCharacterEncoding("euc-kr");
	String siteName1 = request.getParameter("siteName1");
	%>

	<hr>
	<jsp:include page="includeSub2.jsp">
		<jsp:param name="siteName" value="<%=siteName1%>" />
	</jsp:include>

	includeMain2.jsp �������� ������ �����Դϴ�.
	<p>
</body>
</html>