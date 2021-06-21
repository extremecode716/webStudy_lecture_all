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

	includeSub2.jsp 페이지 입니다.<p>

	<b><%=siteName%></b>
	<hr>

	</body>
</html>