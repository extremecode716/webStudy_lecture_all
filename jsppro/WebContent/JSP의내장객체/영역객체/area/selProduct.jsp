<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>selProduct.jsp</title>
</head>
<%
	// HTML FORM 에서 전달된 데이터의 한글인코딩
	request.setCharacterEncoding("euc-kr");
	
	// session 에 username 이름으로 HTML FORM 의 <input type="text" name="username"/> 에 입력된 값을 저장함. 
	session.setAttribute("username",request.getParameter("username"));
%>
<body>
<center>
	<H2>상품선택</H2>
	<HR>
	<%=session.getAttribute("username") %>님이 로그인 한 상태 입니다.

	${username}
	<HR>
	<form name="form1" method="POST" action="add.jsp">
		<SELECT name="product">
			<option>사과</option>
			<option>귤</option>
			<option>파인애플</option>
			<option>자몽</option>
			<option>레몬</option>
		</SELECT>
		<input type="submit" value="추가"/>
	</form>
	<a href="checkOut.jsp">계산</a>
</center>
</body>
</html>