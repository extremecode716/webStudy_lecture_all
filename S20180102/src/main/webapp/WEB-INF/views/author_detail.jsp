<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
div {
	box-sizing: border-box;
}

.cityImg {
	width: 100%;
	height: 550px;
}

.tour {
	padding: 100px 400px 0 400px;
	min-width: 1103px;
}

#guideTitle {
	padding-top: 100px;
}

.rImg {
	width: 70px;
	height: 70px;
	border-radius: 0.5em;
}

/* css 추가 20180201 */
.glist {
	height: 200px;
	width: 85%;
	border: 1px solid lightgray;
	min-width: 937.55px;
}

#servImg {
	width: 300px;
	height: 198px;
	display: inline-block;
	position: absolute;
}

#gimg {
	width: 50px;
	height: 50px;
	border-radius: 25px;
}

#heart {
	width: 30px;
}

.tc_wrap {
	position: absolute;
	left: 730px;
	min-width: 1103px;
}

.rv {
	background-color :#F2F2F2 ;
	height: 150px;
	width: 85%;
	/* border: 1px solid lightgray; */
	min-width: 937.55px;
}

.rv1 {
	height: 150px;
	width: 700px;
	position: absolute;
	left: 630px;
	height: 150px;
	display: inline-block
	/* min-width: 1103px; */
}

.rv2 {
	height: 150px;
	display: inline-block
}

.rImg {
	width: 200px;
	height: 150px;
	display: inline-block;
	position: absolute;
}

#gimgMain {
	width: 250px;
	height: 250px;
	border-radius: 125px;
	margin: auto;
}
</style>

<script type="text/javascript">
// --------------------------------------------------------------------------  좋아요 FUNCTION(다른페이지에서 복붙해 왔어요)
	function delLikeIt(gservNo) {
		// 경로 설정
		s = 'delLikeItPro.do?keyword=${keyword}&order=${order}&call=2&currentPage=${currentPage}&gservNo='+gservNo;
		location.href= s;        
	}
	
	function inLikeIt(gservNo) {
		// 경로 설정
		s = 'inLikeItPro.do?keyword=${keyword}&order=${order}&call=2&currentPage=${currentPage}&gservNo='+gservNo;
		location.href= s;        
	}
</script>

</head>
<body>
	<p>
	<div class="tour">
		<div id="guideTitle">
			<div style="text-align: center; margin-bottom: 50px">
				<img id="gimgMain" alt="가이드사진" src="${pageContext.request.contextPath}/images/${gDto.gimg }">
				<h4><b>${tcDto[0].nickName }</b></h4>
			</div>
			<div style="width: 60%; margin: auto; ">
				<pre style="border: none">${gDto.ginfo}</pre>
			</div>
			<div style="margin: 100px 0px; text-align: center">
				<a  class="btn" 
					href="inQAForm.do?qaReceiver=${gDto.memberId }&memberId=${ID}&gservNo=1" 
				    style="background-color: white; border: 1px solid gray; color: #353535;
				           padding: 10px 30px;  height: 43px; ">
				<img src="${pageContext.request.contextPath}/items/message.png" style="width: 25px; height: 20px">
				  문의하기               
				</a>
			</div>
		</div>
		<div class="modal fade" id="rimg" role="dialog" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">닫기</button>
					</div>
					<div class="modal-body">

						<div class="container" style="width: 100%;">
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
								</ol>

								<!-- Wrapper for slides -->
								<div class="carousel-inner"></div>

								<!-- Left and right controls -->
								<a class="left carousel-control" href="#myCarousel"
									data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#myCarousel"
									data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span> <span
									class="sr-only">Next</span>
								</a>
							</div>
						</div>

					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>

		<!-- 가이드가 가진 gservice -->
		<br> <br>
		<h3>
			개설한 여행 <span style="color: #0489B1;">${total}</span>
		</h3>
		<c:forEach var="list" items="${tcDto }">
			<hr style="min-width: 1103px;">
			<li class="glist"><a
				href="tour_detail.do?gservNo=${list.gservNo }"> <img
					id="servImg"
					src="${pageContext.request.contextPath}/images/${list.imgSrc }"
					alt="상품 이미지">
			</a>
				<div class="tc_wrap">
					<div class="author"
						style="display: inline-block; margin-top: 10px;">
						<a href="author_detail.do?gno=${list.gno }"> <img id="gimg"
							alt="프로필사진"
							src="${pageContext.request.contextPath}/images/${list.gimg }">
							<b>${list.nickName }</b>
						</a>
					</div>
					<c:if test="${list.heart>0 }">
						<img src="${pageContext.request.contextPath}/items/redHeart1.png"
							alt="빨강하트" id='heart' onclick='delLikeIt(${list.gservNo})'>
					</c:if>
					<c:if test="${list.heart==0 }">
						<img src="${pageContext.request.contextPath}/items/heart.png"
							alt="하양하트" id='heart' onclick='inLikeIt(${list.gservNo})'>
					</c:if>
					<br>

					<div style="display: inline-block;">
						<strong><a href="tour_detail.do?gservNo=${list.gservNo}"
							style="font-size: 18px; color: black">${list.gservTitle }</a></strong><br>
						${list.gservArea } <br> <span
							style="font-size: 14px; color: gray;">${list.servTag }</span><br>

						<div
							style="position: absolute; top: 90px; right: 260px; width: 500px">
							<table>
								<tr style="font-size: 20px">
									<td colspan=3 style="text-align: right"><fmt:formatNumber
											value="${list.gservPrice }" type="currency"
											currencySymbol="￦" />/인<br>
									<td>
								</tr>
								<tr>
									<td colspan=3><hr></td>
								</tr>
								<tr style="margin-top: 20px;">
									<td style="display: inline-block;"><img
										style="width: 25px; margin-left: 30px"
										src="${pageContext.request.contextPath}/items/leadTime1.png">
										${list.gservLeadTime }</td>
									<td style="display: inline-block;"><img
										style="width: 28px; margin-left: 30px"
										src="${pageContext.request.contextPath}/items/heart1.png">
										${list.likeIt }</td>
									<td style="display: inline-block;"><img
										style="width: 35px; margin-left: 30px"
										src="${pageContext.request.contextPath}/items/battery1.png">
										${list.remainSize }</td>
								</tr>
							</table>
						</div>
					</div>
				</div></li>
		</c:forEach>
		<div style="clear: both; margin: 20px 0px;">
		<c:if test="${fn:length(tcDto) >= 5}">
			<a href="search_Keyword.do?keyword=${tcDto[0].nickName}" style="font-size: 20px; color: #353535">더보기+</a>
		</c:if>
		</div>

		<div style="clear: both; height: 100px"></div>
		<!-- 후기입니당 -->
		<br> <br>
		<h3>
			리뷰 <span style="color: #0489B1;">${fn:length(revDto)}</span>
		</h3>
		<c:forEach var="list" items="${revDto }">
			<hr>
			<li class="rv">
				<form action="inCmtPro.do">
					<!-- 이미지 외 -->
					<div class="rv1">
						<div class="rv_gsTitle">
							<h4>
								<b> <a href="tour_detail.do?gservNo=${list.gservNo }">${list.gservTitle }</a>
								</b>
							</h4>
						</div>
						<div class="rv_profile">
							<span><b>${list.rtitle }</b></span> <span>&nbsp;
								${list.nickName} &nbsp;</span> <span><c:forEach var="i"
									begin="1" end="${list.rstar }">
									<!-- <img src="https://png.icons8.com/color/30/000000/hollywood-stars.png"> -->
									<!-- <img src="https://png.icons8.com/color/30/000000/rating.png"> -->
									<!-- <img src="https://png.icons8.com/office/30/000000/filled-star.png"> -->
									<img
										src="https://png.icons8.com/office/16/000000/filled-star.png">
								</c:forEach></span> <br>
						</div>
						<div class="rv_content">
							<br>
							<span>${list.rcontent }</span> <br>
							<span style="float: right; bottom:2px;">${list.rcredate }</span>
						</div>
					</div>

					<!-- 이미지 -->
					<div class="rv2">
						<input type="hidden" name="gservNo" value="${list.gservNo }">
						<input type="hidden" name="rgroup" value="${list.rgroup }">
						<input type="hidden" name="nickName" value="${list.nickName }">
						<a data-toggle="modal" data-target="#rimg" role="button"> <img
							class="rImg" name="${list.rimg }"
							src="${pageContext.request.contextPath}/images/${list.rimg }"
							onerror="this.src='${pageContext.request.contextPath}/items/imgforError.png'">
						</a>
					</div>
				</form>
			</li>
		</c:forEach>
	</div>
<div style="clear: both; height: 200px">
</div>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
<script type="text/javascript">
	$(function(){
		$('.rImg').click(function(){
			$('.carousel-inner').empty();
			$('.carousel-indicators').empty();
			var rimg = this.name;
			<c:forEach var="i" begin="0" end="${fn:length(rImgList)}">
				var imgList = "${rImgList[i][0]}";
								
				if(rimg == imgList){
					<c:forEach var="j" begin="1" end="${fn:length(rImgList[i])}">
						<c:if test="${j==1}">
						$('.carousel-indicators').append("<li data-target='#myCarousel' data-slide-to='${j}-1' class='active'></li>");
						$('.carousel-inner').append("<div class='item active'><img src='${pageContext.request.contextPath}/images/${rImgList[i][j-1]}'/></div>");
						</c:if>
						<c:if test="${j!=1}">
						$('.carousel-indicators').append("<li data-target='#myCarousel' data-slide-to='${j}-1'></li>");
						$('.carousel-inner').append("<div class='item'><img src='${pageContext.request.contextPath}/images/${rImgList[i][j-1]}'/></div>");
						</c:if>
					</c:forEach>
				}
			</c:forEach>
		});
	});
</script>
</html>