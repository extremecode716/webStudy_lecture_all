<%@ page contentType="text/html;charset=euc-kr"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
	<body>

	<%
		String siteName = request.getParameter("siteName");
	%>

	includeSub2.jsp ������ �Դϴ�.<p>

	<b><%=siteName%></b>
	<hr>

	</body>
</html>