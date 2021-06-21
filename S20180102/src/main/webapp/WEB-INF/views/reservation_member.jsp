<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(confirm("정말 예약을 삭제하시겠습니까?")){
			return true;
		}
		else {return false;}	
	}
	
	function successTour(payCode, tourDate) {
		var nowDate = new Date();
		var year = tourDate.substr(0,4);
		var month = tourDate.substr(5,2);
		var day = tourDate.substr(8,2);
		tourDate = new Date(year,month,day); // date로 변경
		
		if(nowDate >= tourDate) {
			location.href="successTour.do?payCode="+payCode;
		}
		
		if(nowDate < tourDate) {
			alert("아직 투어가 진행되지 않았습니다.")
			return false;
		}
	}
</script>
<style type="text/css">
	.btn {
		margin : 20px 5px 20px 5px;
		padding: 3px 7px 3px 7px;
	}
	a:hover {
		text-decoration: none;
	}
	
	.card {
		box-shadow: 5px 5px 15px lightgray;
	}
	.page-item {
		float:left;
	}
</style>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		총 ${total }개<br>
		<h2>RESERVATION</h2>
		<br>
		<hr>	
	</div>
	
<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<c:if test="${total > 0 }">
		<c:forEach var="list" items="${list }">
		
			<form action="delResvPro.do" onsubmit="return chk()">
			<input type="hidden" name="payCode" value='<c:out value="${list.payCode }"/>'>
				<div class="col-sm-6">
					<div class="card">
					<c:if test="${list.confirm == 'n' || list.confirm == 'N'}">
						<p style="color: blue; text-align: left; margin-left: 5px">미확정</p>
					</c:if>
					<c:if test="${list.confirm == 'y' || list.confirm == 'Y'}">
						<p style="color: red; text-align: left; margin-left: 5px"">예약 확정</p>
					</c:if>			
					<p style="font-size: 12px; text-align: right;  margin-right: 15px">${list.payCode }</p>		
						<h5 class="card-title" style="margin: 15px 0px 20px 0px">
							<a href="tour_detail.do?gservNo=${list.gservNo }" style="color:black">${list.gservTitle }</a>
						</h5>
					<table style="width: 100%; text-align: center;">
						<tr>
							<td>예약인원 ${list.reMemSize }</td>
							<td>총가격<fmt:formatNumber value = "${list.amount }" type="currency" currencySymbol="￦"/></td>
						</tr>
						<tr>
							<td>예약일 ${list.reservDate }</td>
							<td>투어일 ${list.tourDate }</td>
						</tr>
					</table>
					<c:if test="${list.pay_yn == 'n'}">
						<p><input type="button" class="btn" value="결제" onclick="location.href='inPayForm.do?payCode=${list.payCode}'">
						<input type="button" class="btn" value="예약수정" onclick="location.href='upResvForm.do?payCode=${list.payCode}'">
						<input type="submit" class="btn" value="예약취소"></p>
					</c:if>
					<c:if test="${list.pay_yn == 'y'}">
							<p style="margin: 15px 0px 20px 0px">결제된 상품입니다.<br>
							<c:if test="${list.success_yn == 'n' || list.success_yn == 'N'  }">
								<input type="button" class="btn" value="투어완료" onclick="successTour('${list.payCode}','${list.tourDate }')">
								<span style="font-size: 13px; color: red">투어완료하시면 후기 작성이 가능합니다.</span>
							</c:if>
							<c:if test="${list.success_yn == 'y' || list.success_yn == 'Y' }">
								<span style="font-size: 13px; color: red">투어완료한 상품입니다.</span>
							</c:if>
							</p>
					</c:if>				
					</div>
				</div>
				
			<c:set var="num" value="${num - 1 }"></c:set>
			</form>
		</c:forEach>
	
	</c:if>
	<c:if test="${total ==0 }">
		<p>예약한 상품이 없습니다 :-)</p>
	</c:if>
	
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="reservation_member.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="reservation_member.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="reservation_member.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>

</center>
</div>
</body>
</html>