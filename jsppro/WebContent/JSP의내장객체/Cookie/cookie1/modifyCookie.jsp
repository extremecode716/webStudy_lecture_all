<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.net.URLEncoder" %>

<%
    Cookie[] cookies = request.getCookies();

    if (cookies != null && cookies.length > 0) {
        for (int i = 0 ; i < cookies.length ; i++) {

            if (cookies[i].getName().equals("name")) {
                Cookie cookie = new Cookie("name", URLEncoder.encode("JSP���α׷���"));
                response.addCookie(cookie);
                //cookies[i].setValue(URLEncoder.encode("�ڹٿ� JSP"));
                //response.addCookie(cookies[i]);
            }// if end

        }//for end
    }
%>

<html>
	<head><title>�� ����</title></head>
	<body>
		name ��Ű�� ���� �����մϴ�.
	</body>
</html>
