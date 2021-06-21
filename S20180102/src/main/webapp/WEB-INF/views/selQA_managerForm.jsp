<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table {
	 width: 100%;
	/* table-layout:fixed; */
	margin : 2px;
	padding : 2px;
}
th {
	background-color: rgb(61, 183, 204);
	color: white;
	padding: 5px;
}
td {
	word-break: break-all; /* 텍스트에 따라 폭 변하지 않게 */
	padding: 2px;
}
tr.trOthers {
	background-color: #F2F2F2;
}
td.tdContent {
	padding : 5px;
}
td.tdTitle:hover {
	font-weight: bold;
	background-color: #D8D8D8;
}
.divCon {
	/* background-color : aliceBlue; */
	border : 1px solid aliceBlue;
}
.btn {
	padding: 0px 10px;
}

th, td {
	text-align: center;
}
.page-item {
	float:left;
}
</style>
</head>


<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
	
	<div class="container">
		<center>
			<div style="margin-top: 50px; margin-bottom: 50px">
				<h2>문의사항 관리</h2>
				<br>
				<hr>
			</div>
		</center>	
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<!-- 필터 -->
		<form action="QA_manager.do">
			<select name="qAreply">
				<option value="a" selected="selected">전체 보기</option>
				<option value="y">답변완료</option>
				<option value="n">답변미완료</option>
			</select>
			<input type="submit" class="btn" value="필터적용">
		</form>
		<center>
		<table>
			<caption style="caption-side: top">
				* 제목을 클릭하면 답변하실 수 있습니다.
			</caption>
			<tr>
				<th width="100px">번호</th>
				<th>제목</th>
				<th width="140px">답변여부</th>
				<th width="200px">작성자</th>
				<!-- <th>조회수</th> 넣으려했는데 dto에 없구나-->
				<th width="150px">작성날짜</th>
			</tr>
			<c:forEach var="list" items="${qAList}">
				<tr>
					<td>${num}</td>
					<td><a href="QA_manager_detail.do?qaNumber=${list.qaNumber}">${list.qaTitle}</a></td>
					<c:if test="${list.qaComplete == 'n'}">					
						<td style="color: red">미답변</td>
					</c:if>
					<c:if test="${list.qaComplete == 'y'}">					
						<td style="color: blue">답변완료</td>
					</c:if>
					<td>${list.memberId}</td>
					<td>${list.qaCredate}</td>
				</tr>
				<c:set var="num" value="${num - 1 }"></c:set>
			</c:forEach>
		</table>

	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="QA_manager.do?currentPage=${pg.startPage-pg.pageBlock }&qAreply=${qAreply}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="QA_manager.do?currentPage=${i}&qAreply=${qAreply}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="QA_manager.do?currentPage=${pg.startPage+pg.pageBlock }&qAreply=${qAreply}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
	</center>
	</div>
	
<jsp:include page="adminchat.jsp"></jsp:include>
</body>
</html>