<%@ page contentType="text/html; charset=euc-kr" %>

<html>
	<head>
		<title>��Ű�� �����ϴ� ����</title>
	</head>

<%
   String cookieName = "id";
   Cookie cookie = new Cookie(cookieName, "totoro");
   cookie.setMaxAge(60*2); 
   cookie.setValue("guardian");
   response.addCookie(cookie);
%>

	<body>
	<h2>��Ű�� �����ϴ� ����</h2>
	<P>

"<%=cookieName%>" ��Ű������ �Ǿ����ϴ�.<br>

		<input type="button" value="��Ű�� ����Ȯ��" onclick="javascript:window.location='useCookie.jsp'">
	</P>
	</body>
</html>