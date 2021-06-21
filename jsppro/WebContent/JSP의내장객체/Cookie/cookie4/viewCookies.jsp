<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.net.URLDecoder" %>

<html>
	<head><title>쿠키목록</title></head>
	<body>
	쿠키 목록<br><br>

<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (int i = 0 ; i < cookies.length ; i++) {
        	out.println(i);
%>
			<br>
			<%= cookies[i].getName() %> = 
			<%= URLDecoder.decode(cookies[i].getValue()) %><br>

<%
        }//for end
    } else {
%>
		쿠키가 존재하지 않습니다.
<%
    }
%>

	</body>
</html>