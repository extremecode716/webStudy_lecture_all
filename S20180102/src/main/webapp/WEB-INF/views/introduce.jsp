<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.topImage {
	width: 100%;
	/* height: 400px; */
}

.entry {
	width: 138px;
	height: 190px;
	background-image:
		url("${pageContext.request.contextPath}/items/map_marker_orange.png");
	background-repeat: no-repeat;
}

.title {
	text-shadow: 1px 1px 2px #fff;
	padding-top: 60px;
	text-align: center;
}

.ttt td {
	padding: 15px;
	font-size: 16px;
}

.mini{
	font-size : 15px;
}

#blue{
	color : #2E9AFE;
}
#orange{
	color : #FF8000;
}
</style>

</head>

<body>
	<img class="topImage"
		src="${pageContext.request.contextPath}/items/nightLight00.jpg"
		alt="여행이미지">
	<div class="container">
		<br> <br> <br>
		<h3>왜 <span id="blue">F</span>ollow <span id="orange">M</span>e인가요?</h3>
		<hr>

		<table class="ttt"> 
			<tr>
				<td>
					<div class="entry">
						<h5 class="title">
							다양한
							<p>현지 경험
						</h5>
					</div>

				</td>
				<td style="text-align: center;">항공, 숙박 모두 예약했는데 현지에 가서 어떤 걸
					해야할지 고민중이신가요?
					<p>여러분을 위한 다채로운 현지 여행이 전세계에 준비되어 있습니다.
					<p>follow Me과 함께 소중한 현지에서의 경험을 더욱 풍부하게 만들어보세요.
				</td>
			</tr>

			<tr>
				<td></td>
			</tr>

			<tr>
				<td>
					<div class="entry">
						<h5 class="title">
							최고의
							<p>만족도
						</h5>
					</div>
				</td>
				<td style="text-align: center;">follow Me에서는 저희 서비스를 경험한 여행자들이
					남긴 리뷰들을 통해 여행의 퀄리티를 미리 체크할 수 있습니다.
					<p>이미 국내 업체중 가장 많은 투어와 리뷰를 보유하고 있으며,
					<p>여행자 분들의 소중한 추억을 위해 최선을 다할 것을 약속드립니다.
				</td>
			</tr>

		</table>

		<br> <br> <br>

		<h3>현지 여행 준비 팁을 알려드려요!</h3>
		<hr>
		<br>
		<div class="mini">
		<p><b>1 </b> 내가 원하는 취향이나 테마에 맞춰 투어를 준비해보세요.
		<p>&nbsp; 시내에서 즐기는 워킹 투어, 근교로 가는 차량 투어, 미술관/박물관 투어, 스냅 투어, 골목 투어,
			맛집 투어등 다양한 현지 여행이 준비되어 있습니다.</p>
		<p>&nbsp; follow Me 가이드님들이 정성스레 준비한 투어와 함께하시면 더욱 즐거운 경험을 하실 수 있을
			거에요.</p><br>
		<p><b>2 </b> 더이상 줄서서 기다리지 마세요. 미리 티켓을 구매해 할인 혜택을 받으세요.
		<p>&nbsp; 주요 명소를 방문하시거나 대중 교통을 이용할 계획이신가요?
		<p>&nbsp; follow Me에서 미리 입장권/티켓/패스를 구매하시면 할인 혜택도 받을 수 있고, 경우에 따라 skip the line <sub>티켓 구매자를 위해 따로 마련된 줄로 입장</sub> 하는 경험을
			할 수 있습니다.<p>&nbsp; 시간도 아끼고, 돈도 절약하려면 꼭 마이리얼트립과 함께 하세요.</p><br>
		<p><b>3 </b> 마지막으로, 너무 많이 준비하지 마세요. 여행이 주는 의외성을 즐겨보세요. 
		일정을 빡빡하게 짜기보다 충분히
			여유를 갖고 여행의 순간을 음미해보세요.</p>
		
		</div>
	</div>

	<div style="clear: both; height: 100px">
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>