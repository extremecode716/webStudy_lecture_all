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
	<div class="container">
		<h2 class="text-primary">부서 목록</h2>
		<table class="table table-hover">
			<tr>
				<th>부서코드</th>
				<th>부서명</th>
				<th>근무지</th>
			</tr>
			<c:if test="${not empty list }">
				<c:forEach var="dept" items="${list}">
					<tr>
						<td>${dept.deptno }</td>
						<td><a href="deptView.do?deptno=${dept.deptno}"
							   class="btn btn-info"> ${dept.dname}</a></td>
						<td>${dept.loc }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<th colspan="3">데이터가 없습니다</th>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>