<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>
	<h2>포워딩하는 페이지: forwardFrom1.jsp</h2>

	<%
		request.setCharacterEncoding("euc-kr");
	%>

   forwardFrom1.jsp의 내용 입니다.<br>
   화면에 절대 표시 안됩니다.

	<%	// request 객체로 공유 설정
		request.setAttribute("name","홍길동");
	%>
	
	<jsp:forward page="forwardTo1.jsp"/>  

	</body>
</html>