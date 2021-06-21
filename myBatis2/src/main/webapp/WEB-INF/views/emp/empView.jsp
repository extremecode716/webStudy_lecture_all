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
		$('#list').load('empList.do?deptno=${emp.deptno}');
	});
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-primary">직원 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<td>사번</td>
				<td>${emp.empno }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${emp.ename}</td>
			</tr>
			<tr>
				<td>업무</td>
				<td>${emp.job }</td>
			</tr>
			<tr>
				<td>관리자</td>
				<td>${emp.mgr }</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td>${emp.hiredate }</td>
			</tr>
			<tr>
				<td>급여</td>
				<td>${emp.sal }</td>
			</tr>
			<tr>
				<td>보너스</td>
				<td>${emp.comm }</td>
			</tr>
			<tr>
				<td>부서코드</td>
				<td>${emp.deptno }</td>
			</tr>
		</table>
		<a href="empUpdateForm.do?empno=${emp.empno}" class="btn btn-info">수정</a>
		<a class="btn btn-danger" href="empDelete.do?empno=${emp.empno}">삭제</a>
		<a href="empList.do?deptno=${emp.deptno}" class="btn btn-default">목록</a>
		<div id="list"></div>
	</div>
</body>
</html>