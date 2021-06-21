<%@ page contentType="text/html;charset=euc-kr" %>

<html>
	<body>


<h1>Comment Example</h1>

<%
   String name = "Korea";
%>

<!-- html 주석 부분입니다. '소스보기'에서 보이지요. -->

<%-- 
     이 부분은 JSP 페이지에서만 보이고 '소스보기'를 해도 보이지 않습니다.
     브라우저에 보내지 않는 문장입니다. 
--%>

<!-- <%=name%> html주석에서도 동적인 변수 사용(주석 처리되지만 브라우저에서 소스보기로 출력됨) -->

<%-- <%=name%> jsp주석 --%>

<%=name /* 표현식의 주석 부분 입니다*/  %> Fighting!!!

	</body>
</html>

