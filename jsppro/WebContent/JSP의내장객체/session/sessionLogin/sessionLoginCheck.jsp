<%@ page contentType = "text/html; charset=euc-kr" %>
<%
    String memberId = (String)session.getAttribute("MEMBERID");

	//조건연산자(3항 연산자)
	// (조건식) ? a : b
	// -> 조건식이 true이면 a가, false면 b가 실행됨

    boolean login = memberId == null ? false : true;
%>

<html>
	<head><title>로그인여부 검사</title></head>
	<body>

<%
    if (login) {
%>
		아이디 "<%= memberId %>"로 로그인 한 상태
		
		<a href="sessionLogout.jsp">로그아웃</a> <br><br>
<%
    } else {
%>
		로그인하지 않은 상태 <br><br>
			
		<a href="sessionLoginForm.jsp">로그인</a> <br><br>
		
		<a href="../../request/member/memberform.html">회원가입</a>
<%
    }
%>

	</body>
</html>
