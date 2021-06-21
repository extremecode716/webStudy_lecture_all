<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="header_detail.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	box-sizing: border-box;
}

.rImg {
	width: 200px;
	height: 150px;
	border-radius: 0.5em;
	display: inline-block;
	margin-top: 20px;
}

.rv_profile {
	padding-top: 20px;
	clear: both;
}
.rv_content{
	margin-left: 100px;
	display: inline-block;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	var selected = "${gservNo}";
	// value 값으로 선택
	$("#getReviewGuide").val(selected).prop("selected", true);
	if(selected == null || selected == ""){
		$("#getReviewGuide").val(1).prop("selected", true);
	}
	
	$("#getReviewGuide").change(function () {
		location.href="review_guide.do?gservNo="+this.value;
	})	
});
</script>
</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
 		<h2>후기 관리</h2>
		<br>
		<hr>	
	</div>
</center>
<c:set var="num" value="${pg.total-pg.start+1}"></c:set>

<select id="getReviewGuide">
	<option value="1">상품선택</option>
<c:forEach var="gsDto" items="${gsDto }">
	<option value="${gsDto.gservNo }">${gsDto.gservTitle }</option>
</c:forEach>
</select>
<div style="height: 60px;"></div>
<h3>
	리뷰 <span style="color: #0489B1;">${fn:length(rDto)}</span>
	<br><c:if test="${gservNo == null }">
			<br>
			<span style="font-size: 12px; color: gray;">등록된 가이드 서비스를 선택하시면 댓글을 작성하실 수 있습니다.*</span>
		</c:if>
</h3>
		<c:forEach var="list" items="${rDto }">
			<br>
			<br>
			<hr>
			<li>
					<div>
					<c:if test="${list.rstep ==0 }">
						<div class="rv_profile">
							<span><h4><b>${list.rtitle }</b></h4></span> 
							<span>&nbsp;<br>${list.nickName} &nbsp;</span> 
							<span><c:forEach var="i"
									begin="1" end="${list.rstar }">
									<!-- <img src="https://png.icons8.com/color/30/000000/hollywood-stars.png"> -->
									<!-- <img src="https://png.icons8.com/color/30/000000/rating.png"> -->
									<!-- <img src="https://png.icons8.com/office/30/000000/filled-star.png"> -->
									<img
										src="https://png.icons8.com/office/16/000000/filled-star.png">
									</c:forEach></span><br>
						</div>
						<!-- 이미지 -->
						<div style="width: 150px; float: left">
							<a data-toggle="modal" data-target="#rimg" role="button"> <img
								class="rImg" name="${list.rimg }"
								src="${pageContext.request.contextPath}/images/${list.rimg }"
								onerror="this.src='${pageContext.request.contextPath}/items/imgforError.png'">
							</a>
						</div>
						<div class="rv_content">
							<br>
							<span><pre>${list.rcontent }</pre></span>
							<span style="float:right">${list.rcredate }</span> <br>
						</div>
					<form action="inCmtGuidePro.do">
						<br>
						<br>
						<div style="width: 100%; padding: 20px 0px">
							<span>
							<br>
							<c:if test="${gservNo !=null }">
								<input type="hidden" name="gservNo" value="${list.gservNo }">
								<input type="hidden" name="rgroup" value="${list.rgroup }">
								<input type="hidden" name="payCode" value="${list.payCode }">
								<textarea rows="5" cols="100" name="rcontent" class="form-control"></textarea>
								<input type="submit" class="btn btn-info" style="float: right; padding: 2px 20px; margin-top: 10px" value="답변하기">
							</c:if>
							<br>
							</span>
						</div>
					</form>
					</c:if>
					<c:if test="${list.rstep != 0 }">
						<div style="background-color: #eaeaea; border-radius: 0.5em">
							<span style="padding: 10px;">
							<img src="${pageContext.request.contextPath}/items/RE.PNG" style="width: 30px; padding-top: 10px">
							<pre style="padding-left: 30px">${list.rcontent }</pre></span>
							<br>
							<span style="float:right; margin-right:20px; margin-top: -10px">${list.nickName} ${list.rcredate }</span> 
							<br>
						</div>
							<c:if test="${ID == list.memberId }">
								<form action="delCmtGuidePro.do">
									<input type="hidden" name="rgroup" value="${list.rgroup }">
									<input type="hidden" name="gservNo" value="${list.gservNo }">
									<input type="hidden" name="rstep" value="${list.rstep }">
									<input type="hidden" name="payCode" value="${list.payCode }">
									<input type="submit" class="btn btn-danger" style="float:right; padding: 2px 20px; margin-top: 10px" value="삭제">
								</form>
							</c:if>
					</c:if>
					</div>
			</li>
		</c:forEach>
</div>

<div style="clear: both; height: 200px;">
</div>
</body>
</html>