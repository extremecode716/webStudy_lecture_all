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
		<h2 class="text-primary">부서정보 수정</h2>
		<form action="deptUpdate.do" method="post">
			<input type="hidden" name="deptno" value="${dept.deptno }">
			<table class="table table-hover">
				<tr>
					<td>부서코드</td>
					<td>${dept.deptno}</td>
				</tr>
				<tr>
					<td>부서명</td>
					<td><input type="text" name="dname" required="required"
							   value="${dept.dname}"></td>
				</tr>
				<tr>
					<td>근무지</td>
					<td><input type="text" name="loc" required="required"
							   value="${dept.loc}"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>