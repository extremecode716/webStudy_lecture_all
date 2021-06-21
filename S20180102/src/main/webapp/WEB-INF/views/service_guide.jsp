<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #insertGuiding {
 	padding: 5px 10px;
 	border: 1px solid rgb(61,183,204);
 	display: inline-block; 
 	margin: 10px
 }
 #insertGuiding a{
 	color: rgb(61,183,204);
 }
 #insertGuiding a:hover{
 	color:white;
 }
 #insertGuiding:hover {
	background-color: rgb(61,183,204);
}
a:hover {
	text-decoration: none;
}
</style>
</head>

<body>

<jsp:include page="guideBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		<h2>상품 목록</h2>
		<br>
		<hr>	
	</div>
</center>
	<div id="insertGuiding">
		<a href="inGServForm.do?gno=${list[0].gno}">가이드 상품 등록</a>
	</div>
<center>
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<table style="width: 100%; text-align: center" class="table table-hover">
			<tr>
			    <th width="60px">번호</th>
			    <th width="120px">상품번호</th>
			    <th>상품명</th>
			    <th width="100px">가격</th>
				<th width="120px">서비스시작일</th>
				<th width="120px">서비스종료일</th>
				<th width="60px">노출</th>
				<th width="60px">수정</th>
			</tr>
			<c:forEach var="gServ" items="${list }">
				<tr><td>${num }</td><td>${gServ.gservNo }</td>
					<td><a href="tour_detail.do?gservNo=${gServ.gservNo}">${gServ.gservTitle}</a></td>
					<td><fmt:formatNumber value = "${gServ.gservPrice }" type="currency" currencySymbol="￦"/></td>
					<td>${gServ.gservSDate }</td>
					<td>${gServ.gservEDate}</td>
					<c:if test="${gServ.gservLock =='y'|| gServ.gservLock =='Y'}">
						<td style="font-size: 12px; color:green ">노출됨</td>
					</c:if>
					<c:if test="${gServ.gservLock =='n'|| gServ.gservLock =='N'}">
						<td style="font-size: 12px; color:red">미노출</td>
					</c:if>
					<td><a href="selGServForm.do?gservNo=${gServ.gservNo}">수정</a></td>
				</tr>
				<c:set var="num" value="${num - 1 }"></c:set>
			</c:forEach>
		</table>
		
<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="service_guide.do?currentPage=${pg.startPage-pg.pageBlock}&gno=${list[0].gno}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="service_guide.do?currentPage=${i}&gno=${list[0].gno}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="service_guide.do?currentPage=${pg.startPage+pg.pageBlock}&gno=${list[0].gno}"> 다음 </a></li>
			</c:if>
		  </ul>
</div>

</center>
</div>
</body>
</html>