<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="<%=request.getContextPath() %>/member/login.js"></script>

</head>
<body>

<form method="post" action="<%=request.getContextPath() %>/Login.do">
<table border=1 width=350 align=center>
	<caption>로그인</caption>
	<tr>
		<td>ID</td>	
		<td><input type=text size=30 id="id" name="id" autofocus="autofocus"></td>	
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" size=30 id="passwd" name="passwd"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="회원가입" 
			       onClick="location.href='<%=request.getContextPath()%>/MemberForm.do' ">
			<input type="submit" value="로그인">
			<input type="reset" value="취소">
		</td>
	</tr>
	
</table>
</form>


</body>
</html>