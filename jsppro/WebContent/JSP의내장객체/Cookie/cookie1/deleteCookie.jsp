<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.net.URLEncoder" %>

<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null && cookies.length > 0) {
        for (int i = 0 ; i < cookies.length ; i++) {

            if (cookies[i].getName().equals("name")) {
                Cookie cookie = new Cookie("name", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }//if end

        }//for end
    }
%>

<html>
	<head><title>��Ű ����</title></head>
	<body>
		name ��Ű�� �����մϴ�.
	</body>
</html>
