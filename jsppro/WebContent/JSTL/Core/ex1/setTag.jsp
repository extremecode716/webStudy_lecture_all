<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="num1" value="${20}" />
<c:set var="num2">
10.5
</c:set>
<c:set var="today" value="<%= new java.util.Date() %>" />

<html>
	<head>
		<title>set �±׿� remove �±�</title>
	</head>

	<body>
		���� num1 = ${num1} <br>
		���� num2 = ${num2} <br>
		num1 + num2 = ${num1 + num2} <br>
		������ ${today} �Դϴ�.

		<c:remove var="num1" scope="page" />

		<p>
		������ ���� num1 = ${num1} <br>
		������ ���� num1 + num2 = ${num1 + num2}
	</body>
</html>
