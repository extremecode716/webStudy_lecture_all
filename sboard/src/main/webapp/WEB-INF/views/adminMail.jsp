<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">메일 보내기</h2>
		<form action="adminMail.do" method="post">
			<table class="table table-bordered">
				<tr>
					<td>받는사람 이메일</td>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="50" name="content"
							required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>