<%@ page contentType = "text/html; charset=euc-kr" %>

<html>
	<head><title>include 디렉티브</title></head>
	<body>

<%
    int number = 10;
%>

<%@ include file="includee.jspf" %>

공통변수 DATAFOLDER = "<%= dataFolder %>"

	</body>
</html>