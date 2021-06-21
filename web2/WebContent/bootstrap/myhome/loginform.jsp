<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>

<form method="post" action="login.jsp">
<table border=1 width=350 align=center>
	<caption>로그인</caption>
	<tr><th>ID</th>
		<td><input type=text id="id" name="id" autofocus="autofocus" required></td>
	</tr>
	<tr><th>비밀번호</th>
		<td><input type="password" id="passwd" name="passwd" required="required"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<button type="submit" class="btn btn-outline-secondary btn-sm">로그인</button>
			<button type="reset" class="btn btn-outline-secondary btn-sm">취소</button>
		</td>
	</tr>
</table>
</form>

</body>
</html>

<%@ include file="footer.jsp" %>
