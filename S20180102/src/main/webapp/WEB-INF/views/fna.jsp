<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주하는 질문 F&A</title>

<style type="text/css">

.btn1, .btn2, .btn3, .btn4, .btn5, .btn6, .btn7, .btn8:HOVER {

}

.a1, .a2, .a3, .a4, .a5, .a6, .a7, .a8:HOVER {
	border-top: 1px solid lightgray;
	margin-top: 15px;
	margin-left: 40px;
	padding-top: 10px;
	display: none;
	font-size: 15px;
	width: 700px;
}

li[class^="btn"]:Hover {
	cursor: pointer;
}

div > ul {
	margin-top: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {		
		$(".btn2").click(function() {
			$(".a2").slideToggle();
		});
	});
	$(document).ready(function() {
		$(".btn1").click(function() {
			$(".a1").slideToggle();
		});
	});
	$(document).ready(function() {
		$(".btn3").click(function() {
			$(".a3").slideToggle();
		});
	});
	$(document).ready(function() {
		$(".btn4").click(function() {
			$(".a4").slideToggle();
		});
	});
	$(document).ready(function() {
		$(".btn5").click(function() {
			$(".a5").slideToggle();
		});
	});

	$(document).ready(function() {
		$(".btn6").click(function() {
			$(".a6").slideToggle();
		});
	});
	$(document).ready(function() {
		$(".btn7").click(function() {
			$(".a7").slideToggle();
		});
	});
	$(document).ready(function() {
		$(".btn8").click(function() {
			$(".a8").slideToggle();
		});
	});
</script>
</head>
<body>
<div class="container">
	<center>
		<h1 style="margin-top:30px">FAQ</h1>
		<hr>
	</center>
	<a  class="btn" href="fnaForm.do"
		style="background-color: white; border: 1px solid gray; color: black; height:40px;
		padding: 6px 30px; float: right; margin-right: 20px">
	<img src="${pageContext.request.contextPath}/items/message.png" style="width: 25px; height: 20px">
		 관리자에게 문의하기               
	</a>
		<div>
			<ul>
				<li class="btn1"> 1. <b>follow me</b>을 통해 여행을 가고 싶어요.
								예약은 어떻게 해야 하나요?
			</ul>
			<div class="">
				<ul class="a1">
					<li class="a">
						<b>follow me</b>은 여행지에서 즐길 수 있는 투어, 관광지 입장권, 교통패스,
						액티비티는 물론 현지 문화 체험까지 내가 원하는 여행을 쉽고 빠르게 검색하고 예약할 수 있는 여행 안내 플랫폼
						서비스입니다. <br>
						<p><b>follow me</b> 회원가입 후 여행하실 지역을 검색하신 다음 상품 상세 페이지를 살펴보신 후 예약해 주시면
							됩니다.</p> 상품에 기재된 코스 외에 대한 여행 상품은 '문의하기'를 통해 가이드와 조율하여 가이드의 '견적서'를 받으신
						후 결제를 진행하면 여행이 확정 됩니다. <br>
						<p>
							티켓 상품 구매의 경우 - 배송티켓 : 출국일 - e-바우처(e티켓) : 이용일 혹은 수령일(교환일) 일자 선택 후
							갯수 및 옵션 선택 > 결제 > 영업일 기준 24시간내에 확정 여부 안내 <br>
						</p>
						<p>- 배송티켓 : 확정일 익일 오전에 송장번호 문자메시지 전송</p>
						<p>- e-바우처 혹은 e-티켓 : 영업일 기준 1~3일 이내에 남겨주신 이메일 계정으로 발송</p> <br>
						<p>
							즉시예약 상품 구매의 경우 - 번개마크가 적용된 상품에 해당됩니다.<br> 일자 선택 후 옵션 선택 > 결제
							> 1시간내로 여행자님께서 남겨주신 이메일 계정으로 바우처 발송 (일부 상품은 최대 24시간 소요될 수 있습니다.)
						</p> <br>
					</li>
				</ul>
			</div>
			<ul class=question>
				<li class="btn2">2.결제는 어떻게 하나요?
			</ul>
			<div class="">
				<ul class="a2">

					<li><span class="">국내 결제 진행시 : 신용카드 간편결제, 신용카드,
							실시간계좌이체, 무통장입금 가능합니다. 국외 결제 진행시 : 신용카드 간편결제, 신용카드, 페이팔 가능합니다. 결제
							불가로 인한 결제는 아래 방법으로 진행하시면 됩니다.<br>

							<p><b>[법인카드 결제]</b> 신용카드 간편결제를 통해 결제 진행이 가능합니다. 카드번호, 카드유효기간, 비밀번호 앞
								2자리, 생년월일(사업자번호 10자리) 모두 입력 해 주시면 됩니다.</p>
							<p><b>[해외카드 결제]</b> 신용카드 간편결제를 통해 결제 진행이 가능합니다. 카드번호, 카드유효기간, 비밀번호 앞
								2자리, 생년월일 모두 입력 해 주시면 됩니다.</p>
							<p><b>[결제 인증 시간 초과]</b> 무통장 입금의 경우 결제 기한이 초과되면 결제 진행이 불가합니다. FollowMe
								무통장 전용 계좌로 입금 해 주시면 됩니다. KEB하나은행 / (주)followme /
								***-0102**-followme 입니다. (여행자명과 입금자명이 다를 경우 반드시 고객센터로 연락 주시기
								바랍니다.)</p>
							<p><b>[투어시작 36시간 이내]</b> 투어 시작시간 기준 36시간 이내의 경우 가이드님의 원활한 예약준비, 진행을
								위해 결제가 불가합니다. 단, 예약이 36시간 내에도 가능한 경우는 해당되지 않습니다.</p>
							<p><b>[해당 페이지를 확인할 수 없습니다.]</b> 네트워크 상태가 좋지 않을 경우 확인되는 메시지로 무선 인터넷
								데이터 사용 환경을 변경해 주시기 바랍니다.</p>
					</span></li>
				</ul>
			</div>
			<div>
				<ul>
					<li class="btn3"><span class="" tabindex="0"><span
							class=""></span><span class="">3. 미팅장소에서
									(여행자&가이드) 지각하는 경우 어떻게 하나요?</span></span>
				</ul>
			</div>
			<div class="">
				<ul class="a3">
					<li class="">미팅장소에 올바르게 도착하였는지 확인 뒤, 약속되었던 시각보다 15분 이상 지체되었을
						경우 먼저 여행자 혹은 가이드 연락처로 직접 연락 시도해보셔야 합니다. <br>연결되지 않을 경우,
						FollowMe 고객센터로 문의해주시기를 바랍니다. <br />
					</li>
				</ul>
			</div>

		</div>
		<div>
			<ul>
				<li class="btn4"><span class="" tabindex="0"><span
						class=""></span><span class="">4. 예약 취소
								수수료는 어떻게 되나요?</span></span>
			</ul>
		</div>
		<div class="">
			<ul class="a4">
				<li><p>여행 취소 및 환불 규정은 취소 사유, 예약 종류, 남은 여행 일자에 따라 달라집니다. 자세한
						사항은 여행자 약관 또는 취소/환불 규정을 확인해 주시기 바랍니다.</p>
					<p>단, 상품 상세 페이지에 특별 약관 기준으로 별도의 취소/환불 규정이 명시된 경우 상품 상세 페이지에
						기재되어있는 취소/환불 규정이 적용됩니다.</p></li>
			</ul>
		</div>

		<div>
			<ul>
				<li class="btn5"><span class="" tabindex="0"><span
						class=""></span><span class="">5. FollowMe
								가이드로 활동하고 싶습니다. 가이드 등록은 어떻게 하나요? </span></span>
			</ul>
		</div>
		<div class="">
			<ul class="a5">
				<li><p>PC에서 FollowMe 회원가입 후 FollowMe 우측 상단의 본인의 프로필 클릭 > <b>[파트너
						되기]</b> 버튼 클릭하면 FollowMe 가이드(파트너)로 등록할 수 있습니다. 가이드(파트너) 소개, 상품 등록 및 인터뷰를
						마치시면 FollowMe 가이드로 활동이 가능합니다.</p></li>
			</ul>
		</div>

		<div>
			<ul>
				<li class="btn6"><span class="" tabindex="0"><span
						class=""></span><span class="">6.가이드에게
								문의했는데 답변이 없어요 어떻게 하죠?</span></span>
			</ul>
		</div>
		<div class="">
			<ul class="a6">
				<li><p>문의 후 24시간 이내 현지 가이드님께서 메세지 답변을 하고 있으며, 시차로 인해 답변이
						늦어질 수 있으니 조금만 기다려주세요.</li>
			</ul>
			<div>
				<ul>
					<li class="btn7"><span class="" tabindex="0"><span
							class=""></span><span class="">7.예약하려는
									날짜가 클릭이 안되요. 어떻게 하죠?</span></span>
				</ul>
			</div>
			<div class="">
				<ul class="a7">
					<li><p>날짜가 클릭이 어려운 경우 예약이 불가합니다.</li>
				</ul>
			</div>
		</div>
</div>



<div style="clear: both; height: 200px;">
<br>
<br>
<br>
</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>