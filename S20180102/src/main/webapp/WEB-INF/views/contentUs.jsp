<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.topImage {
	width: 100%;
	height: 450px;
	background-image:
		url("${pageContext.request.contextPath}/items/cozy1.jpg");
	background-repeat: no-repeat;
	background-size: 2200px;
}

.prgOnImage {
	text-shadow: 2px 2px 3px #2E2E2E;
	padding-top: 170px;
	text-align: center;
	color: #fff;
}

td {
	text-align: center;
}

/* div 분할*/
#divContainer {
	/* width: */
	display: flex;
	color: #fff;
	text-align: center;
}

#box-left {
	background: #084B8A;
	flex: 1;
	height: 150px;
	margin: 30px;
}

#box-center {
	background: #084B8A;
	flex: 1;
	margin: 30px;
}

#box-right {
	background: #084B8A;
	flex: 1;
	margin: 30px;
}
</style>

</head>
<body>
	<div class="topImage">
		<div class="prgOnImage">
			<h1>도움이 필요하세요?</h1>
			<br>
			<h4>전화 혹은 email 로 문의해주세요.</h4>
			<h4>고객센터 운영시간: 365일 연중무휴 09:00~22:00(한국시간 기준)</h4>
		</div>
	</div>


	<div class="container">
		<br> <br> <br> <br>
		<p style="text-align: center;">
			<b>Follow ME</b> 고객센터는 <br> 여행자님의 아름다운 하루를 위해 최선을 다하겠습니다 :)
		</p>
		<br> <br> <br>
		<div id="divContainer">
			<div id='box-left'>
				<br> <br>
				<h4>전화 문의</h4>
				<h5>070-follow-me</h5>
			</div>
			<div id='box-center'>
				<br> <br>
				<h4>email 문의</h4>
				<h5>help@followme.***</h5>
			</div>
			<div id='box-right'>
				<br> <br>
				<h4>쪽지 문의</h4>
				<h5>'문의하기'를 통해 작성해주세요</h5>
			</div>
		</div>

	</div>


	<div style="clear: both">
		<br> <br> <br> <br>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>