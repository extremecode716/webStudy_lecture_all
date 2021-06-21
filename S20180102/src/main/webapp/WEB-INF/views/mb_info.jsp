<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

.tablediv {
	background-color: #ECDDDD;
	font-size: 6pt;
	text-align: center;
	font-family: Cambria;
	width: 70%;
}

.tablediv th {
	padding: 5px;
	font-size: 9pt;
	
}

.thead-dark {
	text-align: center;
}

td {
	background-color: #E8DBDB;
	text-align: center;
	padding: 10px;
	font-size: 8pt;
}
</style>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
	<div class="container">
		<center>
			<div class="container" style="margin-top: 50px; margin-bottom: 50px">
				<h2 id=headline>회원 상세정보</h2>
				<hr>
			</div>
			<div class="tablediv">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>비밀번호</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>이름</th>
							<th>회원가입일</th>
							<th>포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${memberDto.memberId }</td>
							<td>${memberDto.nickName}</td>
							<td>${memberDto.pw }</td>
							<td>${memberDto.tel }</td>
							<td>${memberDto.addr }</td>
							<td>${memberDto.mname }</td>
							<td>${memberDto.regidate }</td>
							<td>${memberDto.mpoint }</td>

						</tr>
					</tbody>
					<tr>
						<td colspan="10"><input type="button" class="btn btn-outline-dark"
							value="목록" onclick="location.href='mb_List.do'"></td>
					</tr>
				</table>
			</div>
		</center>
	</div>

</body>
</html>