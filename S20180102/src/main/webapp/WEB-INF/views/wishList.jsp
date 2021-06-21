<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form {
		margin:0;
	}
	a {
		text-decoration: none;
	}

	#heart {
		width:40px;
		height: 33px;
	}
	
	#itemPic {
		width: 298px;
		height:170px;

	}
	#gimg {
		width: 70px;
		height: 70px;
		border-radius: 40px;
		border: 3px solid white;
		margin-top: 130px;
		margin-left:112px;
		position: absolute;
		top: 0;
		left:0;
		z-index: 150;
	}

	.wishBox {
		float:left;
		width: 300px;
		height: 480px;
		margin-right: 50px;
		margin-bottom: 30px;
		position: relative;
		border: 1px solid lightgray;
	}
	.heart {
		position: absolute;
		top: 10px;
		right: 10px;
		z-index: 200;
	}
	.itemPic {
		position: absolute;
		top: 0;
		left:0;
		z-index: 100;
	}
</style>
<script type="text/javascript">
	function chk() {
		if(confirm("정말 삭제하시겠습니까?")){
			return true;
		} else {return false;}	
	}	
</script>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		총 ${wishList.size() }개<br>
		<h2>WISHLIST</h2>
		<br>
		<hr>	
	</div>
</center>	
			<ul class="lst_tour">
				<c:forEach var="list" items="${wishList }">
					<li>
						<!-- wishCard DIV -->
						<div class="wishBox">
							<!-- 좋아요 하트 -->
							<div class="heart">
								<c:if test="${list.heart>0 }">
									<img id ="heart" src="${pageContext.request.contextPath}/items/redHeart1.png" alt="빨강하트" id='heart' onclick="location.href='delLikeItPro.do?gservNo=${list.gservNo}&call=1'">						
								</c:if>
								<c:if test="${list.heart==0 }">
									<img id ="heart" src="${pageContext.request.contextPath}/items/whiteHeart1.png" alt="하양하트" id='heart' onclick="location.href='inLikeItPro.do?gservNo=${list.gservNo}&call=1'">						
								</c:if>						
							</div>
							<!-- 상품 사진 -->
							<div class="itemPic">
								<a class="" href="tour_detail.do?gservNo=${list.gservNo }">
									<img id="itemPic" src="${pageContext.request.contextPath}/images/${list.imgSrc }" onerror="this.src='${pageContext.request.contextPath}/items/itemPic1.png'">
								</a>						
							</div>
							<!-- 가이드 프로필 사진 -->
							<div class="author">
								<a href="author_detail.do?gno=${list.gno }">
									<img id="gimg" alt="프로필사진" onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'" src="${pageContext.request.contextPath}/images/${list.gimg }">
								</a><br>
							</div>
							<div style="margin-top:150px; padding: 10px 20px 0px 20px; position: absolute; width:100%">
									<strong >
										<a href="author_detail.do?gno=${list.gno }" style="font-size: 13px; color: #008299">${list.nickName }</a>
									</strong>
							
							<center>
									<strong>
									<a style="color: black" href="tour_detail.do?gservNo=${list.gservNo }">
									${list.gservTitle }</a>
									</strong>
		
								<p style="font-size: 30px" >
									<hr>
									<fmt:formatNumber value="${list.gservPrice }" type="currency" currencySymbol="￦"/>/인<br>
									<hr>
								</p>


								<br>
								</center>
								<center>
							   <div style="position: absolute; left: 30px; top: 160px">	
									<table style="width: 100%;">
										<tr>
											<td style="display: inline-block;">
											<img style="width:25px; margin-left:30px" src="${pageContext.request.contextPath}/items/leadTime1.png">
											${list.gservLeadTime }</td>
											<td style="display: inline-block;">
											<img style="width:28px; margin-left:30px" src="${pageContext.request.contextPath}/items/heart1.png">
											${list.likeIt }</td>
											<td style="display: inline-block;">
											<img style="width:35px; margin-left:30px" src="${pageContext.request.contextPath}/items/battery1.png">
											${list.remainSize }</td>									
										</tr>
									</table>
								<br>
								  <input style="display: inline-block;" class="btn btn-info" type="button" value="예약하기" onclick="location.href='tour_detail.do?gservNo=${list.gservNo }'">
								  <form style="display: inline-block;" action="delWishList.do" onsubmit="return chk()">
								  	<input type="hidden" name="gservNo" value="${list.gservNo }">						  
									<input type="submit" style="margin:0" class="btn btn-info" value="위시리스트 삭제">
								  </form>
								<br>
								<br>	
									<a style="font-size: 14px" href="search_Keyword.do?keyword=${list.gservArea }">>> ${list.gservArea }의 다른 상품</a>
								</div> 
								</center>
								
							</div>
							</div>
						</li>
				</c:forEach>
			</ul>
			<center>
				<c:if test="${wishList.size() == 0 }">
					등록된 위시리스트가 없습니다 :)
				</c:if>
			</center>
<center>
		<div class="pagination" style="clear: both; margin-top: 50px; margin-bottom: 50px;">
			  <ul style="display: inline-block; padding: 0px; margin: auto;">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<li class="page-item"><a class="page-link" href="wishList.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<li class="page-item"><a class="page-link" href="wishList.do?currentPage=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<li class="page-item"><a class="page-link" href="wishList.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
				</c:if>
			  </ul>
		</div>
</center>
</div>
</body>
</html>