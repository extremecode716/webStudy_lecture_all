<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>�����ϴ� ������ includeMain.jsp �Դϴ�.</h1>

	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<hr>

	<jsp:include page="includeSub.jsp" flush="false"/>
	includeMain.jsp�� ������ �����Դϴ�.

	</body>
</html>