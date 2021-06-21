<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$(".gservLockSel").change(function(){
		var lock = $(this).val();
		$.ajax({
            type : 'POST',
            url  : '<%=context%>/rest/upLock.do',
			data : { lock : lock },
			success : function(data) {
				console.log(data);
				window.location.reload(true);
			}
		});
	});
});

$(function(){
	$(".mainViewSel").change(function(){
		var mainView = $(this).val();
		$.ajax({
            type : 'POST',
            url  : '<%=context%>/rest/upMainView.do',
			data : { mainView : mainView },
			success : function(data) {
				window.location.reload(true);
			}
		});
	});
});
</script>
<style type="text/css">
	.page-item{
		float:left;
	}
</style>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		<h2>상품 목록</h2>
		<br>
		<hr>	
	</div>
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
	<form action="service_manager.do">
	<h6><b>가이드/상품 번호 검색</b></h6>
	<input type="search" class="form-control" style="width: 400px;" 
		   name="searchServ" placeholder="검색" title="검색할 가이드,상품번호를 입력하세요"> 
	</form>
	<table class="table table-hover" style="text-align: center">
		<tr>
			<th width="60px">번호</th>
			<th width="100px">상품번호</th>
			<th>상품명</th>
			<th width="100px">가격</th>
			<th width="120px">서비스시작일</th>
			<th width="120px">서비스종료일</th>
			<th width="120px">노출</th>
			<th width="120px">추천</th>
			
		</tr>
		<c:forEach var="gserv" items="${list }">
			<tr>
				<td>${num }</td>
				<td>${gserv.gservNo }</td>
				<td>${gserv.gservTitle}</td>
				<td><fmt:formatNumber value = "${gserv.gservPrice }" type="currency" currencySymbol="￦"/></td>
				<td>${gserv.gservSDate }</td>
				<td>${gserv.gservEDate}</td>
				<td>
				<c:if test="${gserv.gservLock =='y' || gserv.gservLock =='Y'}">
					<span style="font-size: 13px; color: green">노출</span>
				</c:if>
				<c:if test="${gserv.gservLock =='n' || gserv.gservLock == 'N'}">
					<span style="font-size: 13px; color: gray">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</span>
				</c:if>
					<select class="gservLockSel"  name="gservLock" id="gServLock${gserv.gservNo }">
						<option id="null" value="0">변경</option>
						<option id="Y" value="${gserv.gservNo }Y">Y</option>
						<option id="N" value="${gserv.gservNo }N">N</option>
					</select>
				</td>
				<td>
					<c:if test="${gserv.mainView == 'y' || gserv.mainView == 'Y'}">
						<span style="font-size:13px; color: red">추천</span>
					</c:if>
					<c:if test="${gserv.mainView == 'n' || gserv.mainView == 'N' || gserv.mainView == null}">
						<span style="font-size:13px; color: gray">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</span>
					</c:if>
					
					<select class="mainViewSel" name="mainView" id="mainView${gserv.gservNo }">
						<option id="null" value="0">변경</option>
						<option id="Y" value="${gserv.gservNo }y">Y</option>
						<option id="N" value="${gserv.gservNo }n">N</option>
					</select>
				</td>
			</tr>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</table>
	
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="service_manager.do?currentPage=${pg.startPage-pg.pageBlock}&searchServ=${searchServ}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="service_manager.do?currentPage=${i}&searchServ=${searchServ}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="service_manager.do?currentPage=${pg.startPage+pg.pageBlock}&searchServ=${searchServ}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
</center>
</div>
</body>

</html>