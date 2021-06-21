<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.net.URLEncoder" %>

<%  // 쿠키값을 URLEncoder 클래스를 이용해서 인코딩 한다.
    Cookie cookie = new Cookie("name", URLEncoder.encode("최범균"));
    response.addCookie(cookie);
%>

<html>
	<head><title>쿠키생성</title></head>
	<body>

<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"

	</body>
</html>