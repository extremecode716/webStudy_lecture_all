<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>업무</td>
				<td>급여</td>
				<td>부서코드</td>
				<td>부서명</td>
				<td>근무지</td>
			</tr>
			<c:forEach var="emp" items="${list }">
				<tr>
					<td>${emp.empno }</td>
					<td>${emp.ename }</td>
					<td>${emp.job }</td>
					<td>${emp.sal }</td>
					<td>${emp.deptno }</td>
					<td>${emp.dname }</td>
					<td>${emp.loc }</td>
				</tr>
			</c:forEach>
		</table>
		<a href="deptList.do" class="btn btn-default">부서목록</a>
	</div>
</body>
</html>