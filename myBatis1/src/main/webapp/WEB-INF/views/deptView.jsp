<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- deptList.do 요청한 결과 페이지(deptList.jsp)의 table태그만 불러옴 -->
<script type="text/javascript">
	$(function() {
		$('#list').load("deptList.do table");
	});
</script>
</head>
<body>
	<div class="container">
		<h2>부서 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<th>부서코드</th>
				<td>${dept.deptno}</td>
			</tr>
			<tr>
				<th>부서명</th>
				<td>${dept.dname }</td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>${dept.loc }</td>
			</tr>
			<tr>
				<th colspan="2"><a href="deptList.do" class="btn btn-info">목록</a>
					<a href="deptUpdateForm.do?deptno=${dept.deptno}" class="btn btn-info">수정</a> 
					<a href="deptDelete.do?deptno=${dept.deptno}" class="btn btn-info">삭제</a></th>
			</tr>
		</table>
	</div>
	<div id="list"></div>
</body>
</html>