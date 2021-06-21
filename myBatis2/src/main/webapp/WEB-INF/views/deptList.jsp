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
		<h2 class="text-primary">부서 목록</h2>
		<table class="table table-hover">
			<tr>
				<th>부서코드</th>
				<th>부서명</th>
				<th>근무지</th>
				<th></th>
				<th></th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="dept" items="${list}">
					<tr>
						<td>${dept.deptno}</td>
						<td><a href="empList.do?deptno=${dept.deptno}"
							   class="btn btn-info">${dept.dname}</a></td>
						<td>${dept.loc }</td>
						<td><a href="deptUpdateForm.do?deptno=${dept.deptno }"
							   class="btn btn-success">수정</a></td>
						<td><a href="deptDelete.do?deptno=${dept.deptno }"
							   class="btn btn-danger">삭제</a></td>
				</c:forEach>
			</c:if>
		</table>
		<a href="deptInsertForm.do" class="btn btn-info">부서입력</a> 
		<a href="empAllList.do" class="btn btn-default">전체 직원목록</a>
	</div>
</body>
</html>


