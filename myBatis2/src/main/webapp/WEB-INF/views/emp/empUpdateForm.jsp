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
	<div class="container" align="center">
		<h2 class="text-primary">직원정보 수정</h2>
		<form action="empUpdate.do" method="post">
			<table class="table table-bordered">
				<tr>
					<td>사번</td>
					<td><input type="text" name="empno" readonly="readonly"
						value="${emp.empno}"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="ename" required="required"
						value="${emp.ename }"></td>
				</tr>
				<tr>
					<td>업무</td>
					<td><input type="text" name="job" required="required"
						value="${emp.job }"></td>
				</tr>
				<tr>
					<td>급여</td>
					<td><input type="text" name="sal" required="required"
						value="${emp.sal}"></td>
				</tr>
				<tr>
					<td>보너스</td>
					<td><input type="text" name="comm" required="required"
						value="${emp.comm }"></td>
				</tr>
				<tr>
					<td>부서코드</td>
					<td><select name="deptno">
							<c:forEach var="dept" items="${deptList}">
								<c:if test="${emp.deptno==dept.deptno}">
									<option value="${dept.deptno}" selected="selected">
										${dept.dname}(${dept.deptno})</option>
								</c:if>
								<c:if test="${emp.deptno!=dept.deptno}">
									<option value="${dept.deptno}">${dept.dname}(${dept.deptno})</option>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>