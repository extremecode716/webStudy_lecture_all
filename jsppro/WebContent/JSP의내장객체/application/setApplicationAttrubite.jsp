<%@ page contentType = "text/html; charset=euc-kr" %>
<%
 /*    String name = request.getParameter("name");
    String value = request.getParameter("value"); */
    
    String name = "test";
    String value = "1234";
    
    if (name != null && value != null) {
        application.setAttribute(name, value);
    }
%>

<html>
<head><title>application �Ӽ� ����</title></head>
<body>
<%
    if (name != null && value != null) {
%>
application �⺻ ��ü�� �Ӽ� ����:
 <%= name %>  = <%= value %>
<%
    } else {
%>
application �⺻ ��ü�� �Ӽ� ���� ����
<%
    }
%>
</body>
</html>