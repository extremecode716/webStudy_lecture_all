<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#powerbbsContent {
	font-size: 10;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 안내</title>
</head>
<body>
	<center>
		<div style="margin-top: 50px; margin-bottom: 50px" class="container">
			<h2 id=headline>공지사항</h2>
			<hr>
			<h5>- 이벤트 안내 -</h5>
		</div>
		<div id="powerbbsContent" style="width: 650px;">
			<p>
				<BR>안녕하세요, <b>follow me</b>입니다. <BR> <BR> <BR> <BR>
				<b>2018년 설특집 여행 &amp; 후기 작성하기 이벤트</b>에 참여바랍니다.<BR>그럼 이제,행운을 잡으실
				여행을 소개합니다! <BR> <BR>
			</p>
			<hr>
			<BR>경품은 <font color="#FF0000"><b>follow me 계정으로</b></font> 전달드릴
			예정입니다.<BR>상품 수령을 위해 꼭 쪽지함을 확인해주시기 바랍니다.<BR> <BR> <BR>
			<font color="red">※ 설연휴 여행상품입니다.</font><BR> <BR> <BR>
			<font color="#0000ff"><b>■ EVENT 1. 설연휴여행 리뷰 &amp; 후기평
					작성하기 이벤트</b></font><BR> <BR>
			<div class="txc-textbox"
				style="width: 600px; border: 3px double #cbcbcb; background-color: #ffffff; padding: 10px; text-align: left">
				<b>◆Limited Edition (3군데) </b><BR> <BR>강원도 / 제주도 / 경주<BR>
				<BR>
				<img src="${pageContext.request.contextPath}/images/eventImg.JPG"
					alt="" width="500" height="700" /><BR> <BR> <BR> <BR>
			</div>
			<BR> <BR>
			<div class="txc-textbox"
				style="width: 90%; border: 1px solid #e6e6e6; background-color: #f0f0f0; padding: 10px; text-align: left;">
				<font color="#ff0000"><b>※ 이벤트 안내 사항 - 꼭 읽어 주세요!</b></font><BR>
				<BR>- 부정한 방법으로 이벤트에 참여한 경우 당첨이 취소될 수 있습니다.<BR>- 경품에 당첨되신
				분들은 개인정보 최신화를 3월 30일(화) 까지 진행해 주시기 바랍니다.<BR>- 당첨 공지 발표일로부터 90일
				이내에 인벤 쪽지 등으로 연락이 되지 않을 경우, 당첨이 취소될 수 있습니다.<BR>- 회원 정보가 올바르지
				않거나 확인이 되지 않을 경우, 당첨이 취소될 수 있습니다. <BR>- 이벤트 당첨 경품 수령 및 제세공과금
				처리를 위해 개인정보를 요청할 수 있으며, 제공된 개인정보는 이후 파기 됩니다.<BR>- 문화상품권의 경우 쪽지를
				통해 핀 번호가 발송 될 예정입니다.<BR>
			</div>
		</div>


		<div style="margin: 50px 0px 150px 0px">
				<a href="notice.do"><b>목록으로</b></a>
		</div>


	</center>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>