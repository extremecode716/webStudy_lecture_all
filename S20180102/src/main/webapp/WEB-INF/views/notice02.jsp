<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 상담 안내</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	ul {
		padding: 0px;
	}
</style>
</head>
<body>
	<center>
	<div class="container">
		<div class="center_time">
			<div style="margin-top: 100px; margin-bottom: 50px" class="container">
			<h2 id=headline>공지사항</h2>
			<hr>
			<h5>- 채팅 상담 안내 -</h5>
		</div>
			<div>
				<a href="#" class="list-group-item list-group-item-success">채팅
					가능 시간 : 평일 10:00 ~ 12:30, 13:30 ~ 17:30</a>
				<ul>
					<li class="list-group-item list-group-item-success">상담실 운영 상황에
						따라 변경될 수 있습니다.</li>
					<li class="list-group-item list-group-item-success">상품,이용방법 및
						가이드 등록 사용에 대한 문의 상담만 가능합니다.</li>
				</ul>
				<br>
				<p  class="list-group-item-text">
					<span>참조</span>채팅상담에서는 원격상담 또는 불편상담은 지원하지 않습니다.
				</p>
				<br>
			</div>
		</div>
		<!-- 채팅 상담안내 -->
		<div class="note_box3 section_part4">
			<div>
				<ul>
					<li class="list-group-item list-group-item-success">follow me
						서비스는 개인정보보호 및 정보 유출 방지를 위해 채팅 상담 시 개인정보 수집ㆍ이용ㆍ저장을하지 않고 있습니다.</li>
					<li class="list-group-item list-group-item-success">또한, 채팅 상담
						내용을 저장, 보관하지 않으며 이에 따라 채팅 상담 결과 확인 서비스도 제공하지 않습니다.</li>
				</ul>
			</div>
		</div>
		<!-- 채팅 시간 문구 노출 -->
		<br>
		<div class="chattime_over">
			<p class="list-group-item-text">채팅 상담은 평일 10:00~12:30, 13:30~17:30 까지 가능합니다.</p>
		</div>
		<br>
		<div class="btnarea_c">
			<!-- <button type="button" id="csStart" class="btn mid rd" title="새창열림"><a href="chat.do">채팅상담
				하기</a></button> -->
		</div>

		<div style="margin: 50px 0px 150px 0px">
		<a href="notice.do"><b>목록으로</b></a>
		</div>
	</div>
	</center>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>