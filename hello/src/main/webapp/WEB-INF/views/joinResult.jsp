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
		<h2 class="text-primary">회원가입 결과</h2>
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td>${member.id }</td>
			</tr>
			<tr>
				<th>암호</th>
				<td>${member.pass }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${member.name }</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${member.age }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.addr }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.email }</td>
			</tr>
			<tr>
				<th colspan="2"><a href="joinForm">회원가입 창</a>
			</tr>
		</table>
	</div>
</body>
</html>