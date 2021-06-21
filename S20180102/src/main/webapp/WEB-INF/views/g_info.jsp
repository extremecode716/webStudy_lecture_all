<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가이드 리스트</title>
<meta charset=utf-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style type="text/css">
#headline {
	
	text-align: center;
	font-family: Cambria;
	font-size: 20px;
}

table {
	background-color: #ECDDDD;
	width: 50%;
	font-size: 8pt;
	text-align: center;
	font-family: Cambria;
}


td {
	background-color: #E8DBDB;
	text-align: center;
	padding: 10px;
}
</style>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
	<div class="container">
		<center>
			<div style="margin-top: 50px; margin-bottom: 50px" class="container">
				<h2 id=headline>가이드 상세정보</h2>
				<hr>
			</div>



			<table class="table">
				<thead class="thead-dark">
					<tr>

						<th>아이디</th>
						<th>등록 번호</th>
						<th>사진</th>
						<th>전화번호</th>
						<th>카카오ID</th>
						<th>가이드info</th>
						<th>가입일</th>
						<th>계좌정보</th>
						<th>등급</th>
						<th>매출액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${g_dto.memberId }</td>
						<td>${g_dto.gno}</td>
						<td><img style="width: 130px" src="${pageContext.request.contextPath}/images/${g_dto.gimg }"></td>
						<td>${g_dto.gtel }</td>
						<td>${g_dto.kakaoId }</td>
						<td>${g_dto.ginfo }</td>
						<td>${g_dto.gcredate }</td>
						<td>${g_dto.gaccount }</td>
						<td>${g_dto.ggrade }</td>
						<td>${g_dto.totalCost }</td>
					</tr>
				</tbody>
				<tr>
					<td colspan="10"><input type="button" class="btn btn-dark"value="목록"
						onclick="location.href='gd_manager.do'"> </td>
				</tr>
			</table>
		</center>
	</div>
</body>
</html>