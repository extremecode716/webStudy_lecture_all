<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
table {
	background-color: #E8DBDB;
	font-size: 8pt;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 80%;
    text-align: center;
}

.tablediv th {
	padding: 10px;
	font-size: 10pt;
	
}

.page-item {
		float:left;
}
td {
	background-color: #E8DBDB;
	text-align: center;
	padding: 10px;
}

#headline {
	color: #000000;
	text-align: left;
	font-family: Cambria;
	font-size: 20px;
}

thead {
	text-align: center;
	font-size: 15px;
}
</style>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
	<div class="container">
		<center>
			<div style="margin-top: 50px; margin-bottom: 50px">
				<h2 id=headline>회원 등록현황</h2>

			</div>

			<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<div class="tablediv">
			
			<table class="table">
				<thead class="thead-dark">
					<tr>

						<th>아이디</th>
						<th>닉네임</th>
					<!-- 	<th>비밀번호</th> -->
					<!-- 	<th>전화번호</th> -->
						<th>주소</th>
					<!-- 	<th>이름</th> 
						<th>회원가입일</th>
						<th>포인트</th> -->
						<th>회원등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list }">
						<tr>
							<td><a href="mb_info.do?memberId=${list.memberId}">${list.memberId }</a></td>
							<td>${list.nickName}</td>
							<%-- <td>${list.pw }</td> --%>
							<%-- <td>${list.tel }</td> --%>
							<td>${list.addr }</td>
							<%--  <td>${list.mname }</td> 
							<td>${list.regidate }</td>
							<td>${list.mpoint }</td> --%>
							<td>${list.authority }</td>
						</tr>
						<c:set var="num" value="${num - 1 }"></c:set>
					</c:forEach>
				</tbody>
			</table>
			</div>
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="mb_List.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="mb_List.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="mb_List.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
		</center>
	</div>
</body>
</html>