<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- //<%@ include file="setting.jsp" %> --%>
<%@ include file="header_detail.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.page-item {
		float:left;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			var gNo = ${gno};
			var gServNo = $('#gServNo').val() == "" ? null : $('#gServNo').val();
			var startSearch = $('#start').val() == "" ? null : $('#start').val();
			var endSearch = $('#end').val() == "" ? null : $('#end').val();
			console.log(gNo);
			console.log(gServNo);
			console.log(startSearch);
			console.log(endSearch);
			if(startSearch != null && endSearch != null && gServNo != null){
				console.log("all");
				location.href='downExcel.do?gno='+gNo+'&gservNo='+gServNo+'&startSearch='+startSearch+'&endSearch='+endSearch;
			}else if(startSearch != null && endSearch != null){
				console.log("date");
				location.href='downExcel.do?gno='+gNo+'&startSearch='+startSearch+'&endSearch='+endSearch;
			}else if(gServNo != null){
				console.log("gServNo");
				location.href='downExcel.do?gno='+gNo+'&gservNo='+gServNo;
			}else{
				console.log("else");
				location.href='downExcel.do?gno=${gno}';
			}
		});
	});
</script>
</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
 		<h2>매출통계보기 및 조건별 매출검색</h2>
		<br>
		<hr>	
	</div>
</center>
 <form action="pay_guide.do">
 <input type="hidden" name="gno" value="${gno }">
  <h5><b>서비스 번호 검색</b></h5> 
  <input type="search" class="form-control" style="width:30%;" id="gservNo" name="gservNo">
 </form>
 <form action="pay_guide.do">
 <input type="hidden" name="gno" value="${gno }">
  <h5><b>기간별 검색</b></h5>
  <br> 시작일 : <input type="date" id="start" class="form-control" style="width: 20%; display: inline-block;" name="startSearch" required="required"> 
     ~ 종료일 : <input type="date" id="end"   class="form-control" style="width: 20%; display: inline-block; " name="endSearch" required="required">
	<input type="submit" value="검색" class="btn">
</form>
<br>
<button class="btn" style="float: right; margin-bottom: 20px">EXCEL출력</button>
<h5><b>기간별 매출 통계</b></h5>
<c:if test="${payGlist[0]!=null}">
<table id="payg" class="table">
	<tr>
		<th width="35%">서비스명</th>
		<th width="15%">매출일</th>
		<th width="15%">예약인원</th>
		<th width="15%">총 결제금액</th>
		<th width="20%">적립금(수수료제외금액)</th>
	</tr>
	<c:forEach var="payG" items="${payGlist }">
			<tr>
				<td>${payG.gservTitle }</td>
				<td>${payG.tourDate }</td>
				<td>${payG.reMemSize }</td>
				<td>${payG.reMemSize * payG.gservPrice}</td>
				<td>${payG.reMemSize * payG.gservPrice /100 * 70}</td>
			</tr>
		</c:forEach>
</table>
<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg2.startPage > pg2.pageBlock }">
				<li class="page-item"><a class="page-link" href="service_guide.do?aPage=${pg2.startPage-pg2.pageBlock}&gPage=${pg2.startPage-pg2.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg2.startPage }" end="${pg2.endPage }">
				<li class="page-item"><a class="page-link" href="service_guide.do?aPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg2.endPage < pg2.totalPage }">
				<li class="page-item"><a class="page-link" href="service_guide.do?aPage=${pg2.startPage+pg2.pageBlock}&gPage=${pg2.startPage-pg2.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
</div>
</c:if>
<c:if test="${payGlist[0]==null}">
<br>
<center>
매출 내역이 없습니다.
</center>
</c:if>
<br><hr><br>
<h5><b>입출금 내역</b></h5>
<c:if test="${aList[0]!=null}">
<table id="payg" class="table table-hover" style="text-align: center">
	<tr>
		<th>가이드번호</th>
		<th>거래일시</th>
		<th>입금</th><th>출금</th><th>잔액</th>
	</tr>
	<c:forEach var="aInOut" items="${aList}">
			<tr>
				<td>${aInOut.gno }</td>
				<td>${aInOut.depositDate }</td>
				<td>${aInOut.inCost }</td>
				<td>${aInOut.paymentCost }</td>
				<td>${aInOut.balance }</td>
			</tr>
	</c:forEach>
</table>
<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="service_guide.do?aPage=${pg.startPage-pg.pageBlock}&gPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="service_guide.do?aPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="service_guide.do?aPage=${pg.startPage+pg.pageBlock}&gPage=${pg.startPage-pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
</div>
</c:if>
<c:if test="${aList[0]==null}">
<center>
입출금 내역이 없습니다.
</center>
</c:if>
<center>
<form action="pay_guideForm.do">
	<input type="hidden" name="gno" value="${gno }">
	<input type="submit" value="정산" class="btn btn-info" style="width: 50%; margin-top: 50px;">
</form>
</center>
</div>
</body>
</html>