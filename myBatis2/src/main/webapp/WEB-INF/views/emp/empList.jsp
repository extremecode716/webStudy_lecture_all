<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#list').load('deptList.do');
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">${dept.dname}직원목록</h2>
		<table class="table table-striped">
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>업무</td>
				<td>급여</td>
				<td>부서코드</td>
			</tr>
			<tr>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">직원이 없는 부서입니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="emp" items="${list }">
						<tr>
							<td>${emp.empno }</td>
							<td><a href="empView.do?empno=${emp.empno}"
								   class="btn btn-info">${emp.ename}</a></td>
							<td>${emp.job}</td>
							<td>${emp.sal}</td>
							<td>${emp.deptno}</td>
						</tr>
					</c:forEach>
				</c:if>
		</table>
		<a href="deptList.do" class="btn btn-success">부서목록</a> 
		<a href="empInsertForm.do" class="btn btn-success">직원 입력</a>
		<div id="list"></div>
	</div>
</body>
</html>



