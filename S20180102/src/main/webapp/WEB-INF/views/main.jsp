<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  display: inline-block;
  overflow: hidden;
  margin: 10px 1%;
  width: 500px;
  height: 300px;
  color: #ffffff;
  text-align: center;
  font-size: 16px;
  background-color: #000000;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
#themeImg{
		width: 500px;
		height: 300px;
	}




	#heart {
		width:40px;
		height: 33px;
	}
	
	#itemPic {
		width: 298px;
		height:170px;

	}
	#gimg1 {
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
		height: 400px;
		margin-right: 50px;
		margin-bottom: 30px;
		position: relative;
		border: 1px solid lightgray;
	}
	.heart {
		position: absolute;
		top: 10px;
		right: 10px;
		z-index: 250;
	}
	.itemPic {
		position: absolute;
		top: 0;
		left:0;
		z-index: 100;
	}


	.newReview {
		padding-top: 100px;
		padding-bottom: 100px;
	}

	.mainImage {
		width:100%;
		height:400px;
	}
	
	.rImg {
		width: 80px;
		height: 80px;
		border-radius: 0.5em;
	}
	
	#gimg {
		width: 100px;
		height: 100px;
		border-radius: 50px;
	}
	
	.themes{
		background-color: #353535;
		padding-top: 60px;
		padding-bottom: 60px;
		
	}

	.popularGuide {
		clear: both;
		background-color: rgb(254,153,0);
		padding-top: 60px;
		padding-bottom: 60px;
	}
	
	a:hover {
		text-decoration: none;
	}
	

	#more_items{
		text-align: center; 
		margin:auto; 
		padding-top:13px; 
		height: 50px; 
		width: 150px;
		border: 1px solid gray; 
		color: #353535; 
		margin-bottom: 60px;
	}
	#more_items:hover {
		cursor: pointer;
	}
	#close_items:hover {
		cursor: pointer;
	}
	#close_items{
		text-align: center; 
		margin:auto; 
		padding-top:13px; 
		height: 50px; 
		width: 150px;
		border: 1px solid gray; 
		color: #353535; 
		margin-bottom: 100px;
		display: none;
		clear: both;
	}
	#mainImage img{position:absolute;}
	.active{
	    z-index:1;
	    opacity:1;
	}
	
	.mainPage {
		margin-top : 450px;
	}
	
</style>
</head>
<body>
<div id="mainImage">
	<img class="mainImage active" src="${pageContext.request.contextPath}/items/mainView1.jpg" alt="여행이미지">
	<img class="mainImage" src="${pageContext.request.contextPath}/items/mainView2.jpg" alt="여행이미지">
	<img class="mainImage" src="${pageContext.request.contextPath}/items/mainView3.jpg" alt="여행이미지">
	<img class="mainImage" src="${pageContext.request.contextPath}/items/mainView4.jpg" alt="여행이미지">
	<img class="mainImage" src="${pageContext.request.contextPath}/items/mainView5.jpg" alt="여행이미지">
	<img class="mainImage" src="${pageContext.request.contextPath}/items/mainView6.jpg" alt="여행이미지">
</div>
<div class="mainPage">
<div class="container">
		<div style="margin-top: 60px; margin-bottom: 50px; height: 80px;">
			<h3>오늘의
			<br>
			 추천 여행지!</h3>
		</div>
		<div id="hotItems" style="margin-bottom: 30px; height: 430px; overflow: hidden;">
			<ul class="lst_tour">
				<c:forEach var="list" items="${tcDto }">
					<li>
						<!-- wishCard DIV -->
						<div class="wishBox">
							<!-- 좋아요 하트 -->
							<div class="heart">
								<c:if test="${list.heart > 0 }">
									<img id ="heart" src="${pageContext.request.contextPath}/items/redHeart1.png" alt="빨강하트" id='heart' onclick="location.href='delLikeItPro.do?gservNo=${list.gservNo}&call=3'">						
								</c:if>
								<c:if test="${list.heart == 0 }">
									<img id ="heart" src="${pageContext.request.contextPath}/items/whiteHeart1.png" alt="하양하트" id='heart' onclick="location.href='inLikeItPro.do?gservNo=${list.gservNo}&call=3'">						
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
									<img id="gimg1" alt="프로필사진" onerror="this.src='${pageContext.request.contextPath}/items/login.png'" src="${pageContext.request.contextPath}/images/${list.gimg }">
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
								</div> 
								</center>
								
							</div>
							</div>
						</li>
				</c:forEach>
			</ul>
			<br>
		</div>
		<div id="more_items">더 보기+</div>
		<div id="close_items">∧ 닫기</div>
	</div>
	

	<div class="popularGuide">
		<div class="container ">
			
			 <center>
			 	<h4 style="color:white">여행 좀 할 줄 아는 당신! 즐거운 하루를 위한 우리의 "가이드"가 되어주세요!</h4>
			 	<br>
			 	<input type="button" class="btn" 
			 	       style="padding: 10px 30px; margin-bottom: 20px; height: 50px; border: 2px solid white; 
			 	              background-color: rgb(254,153,0); color:white " 
			 	       value="가이딩 등록하기" 
			 	       onclick="location.href='inGServ.do'">
			 	<h3>오늘은 내가 리드한다!</h3>
				<h4>인기 가이드</h4>
			 	<br>
			 </center>
				<ul style="padding:0">
				<c:set var="i" value="1"/>
				<c:forEach var="gDto" items="${gDto }">
					<li style="display: inline-block; margin-left: 100px;">	
					<div style="margin-bottom:20px; display: inline-block;" onmouseover="showNickName(${i})" onmouseout="hideNickName(${i})">
						<img id="gimg" alt="프로필사진" 
							 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'" 
							 src="${pageContext.request.contextPath}/images/${gDto.gimg }">
						<br>
					<div class="guide${i }" style="display: none">
						<a href="author_detail.do?gno=${gDto.gno }">	
							<div class="guide${i }" style="margin-top: -100px; z-index:10; opacity: 0.7; display:none; position: absolute; width: 100px;  background-color: black; height: 100px; border-radius:50px;"></div>	
							<div class="guide${i }" style="position: absolute; z-index:12; color: white; display:none; margin-top: -60px; margin-left: 25px">${gDto.nickName }</div>
						</a>
					</div>
					</div>
					</li>	
					<span style="display: none">${i = i+1 }</span>
				</c:forEach>
				</ul>
		</div>
	</div>
	
	<div class="themes">
		<div class="container">
			<h3 style="color: white">테마여행상품</h3>
			<h4 style="color: rgb(254,153,0)">떠나자 비밀의 바다</h4>
			<figure class="snip1384">
				  <img id="themeImg" class="card-img-top" src="${pageContext.request.contextPath}/images/강화도고려궁지.jpg" alt="Card image cap">
				  <figcaption>
				    <h3 style="line-height: 200px">명소</h3>
				    <!-- <p>다양한 여행지의 명소들을 만나보세요</p><i class="ion-ios-arrow-right"></i> -->
				  </figcaption>
				  <a href="search_filter.do?gservSub=명소"></a>
				</figure>
				<figure class="snip1384">
					<img id="themeImg" class="card-img-top" src="${pageContext.request.contextPath}/images/empireust.jpg" alt="Card image cap">
					<figcaption>
				    	<h3 style="line-height: 200px">문화</h3>
				    	<!-- <p>다양한 여행지의 명소들을 만나보세요</p><i class="ion-ios-arrow-right"></i> -->
				  	</figcaption>
					<a href="search_filter.do?gservSub=문화"></a>
				</figure>
				<figure class="snip1384">
				  	<img id="themeImg" class="card-img-top" src="${pageContext.request.contextPath}/images/ct투어.jpg" alt="Card image cap">
					<figcaption>
				    	<h3 style="line-height: 200px">음식</h3>
				    	<!-- <p>다양한 여행지의 명소들을 만나보세요</p><i class="ion-ios-arrow-right"></i> -->
				  	</figcaption>
					<a href="search_filter.do?gservSub=음식"></a>
				</figure>
				<figure class="snip1384">
				  <img id="themeImg" class="card-img-top" src="${pageContext.request.contextPath}/images/bungalows.jpg" alt="Card image cap">
				  <figcaption>
				    	<h3 style="line-height: 200px">자연</h3>
				    	<!-- <p>다양한 여행지의 명소들을 만나보세요</p><i class="ion-ios-arrow-right"></i> -->
				  	</figcaption>
				<a href="search_filter.do?gservSub=자연"></a>
				</figure>
		</div>
	</div>
	
	<div class="newReview">
		<div class="container">
				<h5>날이 좋아서, 날이 좋지 않아서, 날이 적당해서</h5> 
				<h3 style="margin-bottom:20px; color: rgb(6,183,204)">모든 날이 좋았다</h3>
			<center>
			   <table style="width: 80%" class="table">
			   		<caption style="caption-side: top;">신규 후기글</caption>
					<c:forEach var="revDto" items="${rDto}">
						<tr>
						
						<td rowspan=3>
							<a href="tour_detail.do?gservNo=${revDto.gservNo }">
							<img class ="rImg" src="${pageContext.request.contextPath}/images/${revDto.rimg }" onerror="this.src='${pageContext.request.contextPath}/items/review_alt.png'">
							</a>
						</td>
							<td colspan=4>${revDto.rtitle }</td>
							<td><strong style="color: #3DB7CC">DATE</strong> ${revDto.rcredate }</td>		
						</tr>
						<tr>
							<td  rowspan=2, colspan=4><pre>${revDto.rcontent }</pre></td>
							<td style="color: rgb(254,153,0)"><strong style="color: #3DB7CC">STAR</strong> <c:forEach var="i" begin="1" end="${revDto.rstar }">★</c:forEach> </td>
						</tr>
						<tr>
							<td><strong style="color: #3DB7CC">BY</strong> ${revDto.nickName }</td>
						</tr>
					</c:forEach>
			  	</table>
			 </center> 
		</div>
	</div>
</div>






<div style="clear: both">
<br>
<br>
<br>
</div>
<c:if test="${managerChk !=1 }">
<jsp:include page="chat.jsp"></jsp:include>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
	);
	function showNickName(i) {
		$(".guide"+i).show();
	}
	function hideNickName(i) {
		$(".guide"+i).hide();
	}
	
	$(function(){
		$("#more_items").click(function(){
			$("#hotItems").css("overflow","visible")
			$("#more_items").hide();
			$("#close_items").show();
		});
		$("#close_items").click(function(){
			$("#hotItems").css("overflow","hidden")
			$("#more_items").show();
			$("#close_items").hide();
		});
		
	})
	
	
	var showImg, nextImg; 
	
	function fadeInOut() {
		//id가 content의 노드중  첫번째img(img:eq(0))를 showImg에 저장
		showImg = $("#mainImage img:eq(0)");
		//id가 content의 노드중  두번째img(img:eq(1))를 showImg에 저장
		nextImg = $("#mainImage img:eq(1)");
		//nextImg에 active클래스 적용
		 nextImg.addClass("active");
		//nextImg를 처음에는 보이지 않게 처리
		 nextImg.css("opacity","0")
		//애니메이션 효과로 1초동안 opacity 값이 1로 변경되면서 나타난다.
		.animate({opacity:1},1000,function(){
		
		//콜백함수 실행, 
		//처음 보였던 이미지를 dic id="content" 안의 가장 마지막 노드로 이동시킨다.
			$("#mainImage").append(showImg);
		//showImg에 적용되어 있던 active 클래스를 제거한다.
			showImg.removeClass("active");
		})
	}
		
	var timer = setInterval("fadeInOut()",3000);
	
</script>

</html>
