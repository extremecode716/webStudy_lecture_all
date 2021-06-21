<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th {
		text-align: center;
	}
	.page-item{
		float:left;
	}
</style>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>

<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		총 ${payList.size() }개<br>
		<h2>PAYMENT</h2>
		<br>
		<hr>	
	</div>
	<table style="width: 80%" class="table table-hover">
		<c:if test="${total > 0 }">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>투어일자</th>
			<th>결제금액</th>
			<th>주문상태</th>
		</tr>
			<c:forEach var="list" items="${payList}">
				<tr>
					<td>${list.payCode }</td>
					<td><a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a></td>
					<td>${list.tourDate }</td>
					<td><fmt:formatNumber value = "${list.amount }" type="currency" currencySymbol="￦"/></td>
					<td><a href="pay_detail.do?payCode=${list.payCode }">결제완료(${list.pay_method })</a></td>
				</tr>
				<c:set var="startNum" value="${startNum -1 }" />
			</c:forEach>
		</c:if>
	</table>
		<c:if test="${total ==0 }">
			<center>
					결제한 상품이 없습니다 :-)
			</center>			
		</c:if>


	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="pay_member.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="pay_member.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="pay_member.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
</center>
</div>
</body>
</html>