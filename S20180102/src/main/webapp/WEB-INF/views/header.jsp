<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Follow Me:나의 즐거운 여행 파트너</title>
<link rel="stylesheet"
	 href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
	integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
	crossorigin="anonymous">
<script type="text/javascript" src="js/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"
	integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Fugaz+One"
	rel="stylesheet">
	
<script src="js/kakao.min.js"></script>

<!-- RSA SCRIPT -->
<script src="js/jsbn.js"></script>
<script src="js/rsa.js"></script>
<script src="js/prng4.js"></script>
<script src="js/rng.js"></script>

<script src="https://apis.google.com/js/api:client.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<style type="text/css">
/* 필터링 버튼*/
.sbmBttn {
	width : 80px;
	height : 30px;
	border: 0px;
	border-radius: 5px;
	background-color:#FF8000;
	color : #fff;
	margin: 10px 30px;
}
pre{
    padding:10px;
    overflow: auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */
	font-family: sans-serif;
}  
.sbmBttn:hover {
	background-color:#DF7401;
}

/* 체크박스 */
input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	color: #1C1C1C;
}

input[type="checkbox"]+label span {
	display: inline-block;
	/* icon 사이즈에 따라 바꾸어주기 마지막 아이콘 > 19px 나머지 > 16px*/
	width: 19px;
	height: 19px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	/* 아래 png중 마음에 드시는 것으로 사용하세요! 아마 마지막 아이콘이 가장 마음에 드실거에요 ㅎㅎ 각각 순서대로 세트입니다 :) */
	/* background:url(https://png.icons8.com/dusk/16/000000/unchecked-checkbox.png) left top no-repeat; */
	/* background:url(https://png.icons8.com/office/16/000000/unchecked-checkbox.png) left top no-repeat; */
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		left top no-repeat;
	cursor: pointer;
}

input[type="checkbox"]:checked+label span {
	/* background:url(https://png.icons8.com/dusk/16/000000/checked-2.png); */
	/* background:url(https://png.icons8.com/office/16/000000/checked-2.png); */
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		-19px top no-repeat;
}
/* 라디오버튼 */
input[type="radio"] {
	display: none;
}

input[type="radio"]+label {
	color: #1C1C1C;
	font-family: Arial, sans-serif;
}

input[type="radio"]+label span {
	display: inline-block;
	width: 19px;
	height: 19px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		-38px top no-repeat;
	cursor: pointer;
}

input[type="radio"]:checked+label span {
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		-57px top no-repeat;
}

/* 기본 셋팅 */
body {
	margin: 0;
	padding: 0px;
}

ul, p {
	margin: 0;
}

li {
	list-style: none;
}

.hearderFrm {
	margin: 0px;
}
/* 헤더 */
.header_top {
	padding-left: 30px;
	width: 100%;
	height: 50px;
	position: fixed;
	top: 0;
	background-color: #FFFFFF;
	z-index: 1000;
	min-width: 768px;
}

.navbar-header {
	width: 100%;
	height: 50px;
	margin-top: 50px;
	background-color: rgb(61, 183, 204);
	min-width: 768px;
}

.logoArea {
	float: left;
	padding-top: 10px;
}

.loginArea {
	float: right;
}

.searchArea {
	float: right;
}

.category1 {
	font-family: 'Fugaz One', sans-serif;
	color: white;
	font-size: 20px;
	padding: 10px;
}

.category {
	float: left;
	margin-left: 20px;
	font-family: 'Fugaz One', sans-serif;
	color: #1294AB;
	font-size: 20px;
	padding: 10px;
}

.category:hover, .category1:hover {
	background-color: #005766;
	cursor: pointer;
}

.left {
	float: left;
}

.categoryList {
	margin: 0px;
	width: 100%;
	height: 400px;
	padding-top: 40px;
	background-color: #ffffff;
	/* 	opacity : 0.9; */
	position: absolute;
	top: 100px;
	left: 0px;
	border-bottom: 1px solid gray;
	display: none;
	z-index: 100;
	
}

#user_bar {
	display: none;
	background-color: #ffffff;
	width: 230px;
	padding: 20px 30px;
	border: 1px solid lightgray;
	position: absolute;
	left: auto;
	right: auto;
	margin-top: 2px;
	margin-left: -110px;
	border-radius: 5px;
}
#user_bar_li {
	float: left;
	margin-left: 15px;
	font-size: 14px;
}

#user_bar li {
	font-size: 15px;
	margin-top: 10px;
	margin-bottom: 10px;
}

/* 검색 관련 css */
.search {
	border-radius: 3px;
	width: 260px;
	height: 30px;
	padding: 0px 20px 0px 20px;
	outline: none;
	border: 1px solid rgb(61, 183, 204);
	font-size: 13px;
}

form {
	margin: 0;
}

.btn {
	height: 30px;
}

.block {
	border: 2px solid white;
	padding: 0 5px;
	height: 30px;
	overflow: hidden;
	background: #fff;
	width: 150px;
	font-family: Gulim;
	font-size: 13px;
	margin-top:10px;
}

#msg {
	display: inline-block; 
	background-color: rgb(254,153,0); 
	border:1px solid white;
	border-radius: 12.5px; 
	width: 25px; 
	height: 25px;
	padding: 2px;
	text-align: center; 
	color: white;
	font-weight: bold;
	font-size: 13px;
	margin-left: -35px;
	margin-top: -5px;
	margin-right: 20px;
}
a:hover {
	text-decoration: none;
}

.block ul, .block li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.block li a {
	display: block;
	height: 30px;
	line-height: 30px;
	color: #555;
	text-decoration: none;
}

.block li span {
	padding: 2px 5px;
	background: rgb(61, 183, 204);
	color: #fff;
	font-weight: bold;
	margin-right: 10px;
}
/* 이미지 사이즈 조정 */
#logo {
	width: 150px;
	height: 30px;
}

.loginBtn {
	padding: 5px 20px;
	background-color: rgb(61, 183, 204);
	color: white;
	height: 40px;
	width: 100%;
}

#user {
	width: 50px;
	height: 45px;
	margin-top: 2.5px;
	cursor: pointer;
}

#loginLogo {
	width: 40px;
	height: 40px;
	border-radius: 20px;
	border: 1px solid gray;
	margin-top: 5px;
}

#srch_img {
	margin-bottom: -10px;
	margin-top: 10px; margin-right : 30px;
	width: 33px;
	height: 28px;
	margin-right: 30px;
}

#snsLogo {
	width: 50px;
	height: 50px;
}
/* 로그인 팝업 css */
</style>
<script type="text/javascript">
 	$(document).ready(function() { 
 		// 인기검색어 get Ajax
	 	$.ajax({
	 			type:'get',
				url:"<%=context%>/getKeyword.do",  
				dataType:'text',
				success: function(data){
					var obj = JSON.parse(data);
					var output='';
					$.each(obj, function(index,item){
						output += "<li><a href='#'><span>"+item.hotOrder+"</span>"+item.srch_title+"</a></li>";
					}); // each End
					document.getElementById("ticker").innerHTML = output; 
				}}); //ajax End
				
				
		// 새로온 메시지 Chk
		$.ajax({
	 			type:'get',
				url:"<%=context%>/getNewMessage.do",  
				dataType:'text',
				success: function(data){
					if(data > 0) {
						var output = "<img src='${pageContext.request.contextPath}/items/message3.png'"+ 
					                 "style='width: 50px; margin-right: 20px;'><div id='msg'>"+data+"</div>";
						document.getElementById("newMsg").innerHTML = output;
						$("#newMsg").attr("title","새로운 메시지가 있습니다.");
						$(".tooltip-inner").text ="새로운 메시지가 있습니다.";
					} else {
						$("#newMsg").attr("title","새로운 메시지가 없습니다.");
						$(".tooltip-inner").text = "새로운 메시지가 없습니다.";
					}
				}}); //ajax End
				
		$("#pw").change(function () {
			//RSA 키 GET
			$.ajax({
					type:'get',
					url:"<%=context%>/getRSA.do",  
					dataType:'text',
					success: function(data){
						var obj = JSON.parse(data);
						 // RSA 암호화	
						var rsaPublicKeyModulus = obj.publicKeyModulus;
						var rsaPublicKeyExponent = obj.publicKeyExponent;
						var encPassword = fnRsaEnc(document.getElementById("pw").value, rsaPublicKeyModulus, rsaPublicKeyExponent);
						var encId = fnRsaEnc(document.getElementById("Id").value, rsaPublicKeyModulus, rsaPublicKeyExponent);
						$("#encPw").val(encPassword);
						$("#encId").val(encId);
						
						function fnRsaEnc(value, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
						    var rsa = new RSAKey();
						    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
						    var encValue = rsa.encrypt(value);     // 사용자ID와 비밀번호를 RSA로 암호화한다.
						    return encValue;
						}		 
			}}); //ajax End
		})		
	});
</script>

</head>
<body>

	<!-- 로그인 팝업창 -->
	<div class="modal fade" id="plogin" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">닫기</button>
				</div>
				<div class="modal-body">
					<center>
						<h1 class="modal-title">
							<img id="logo"
								src="${pageContext.request.contextPath}/items/logo2.JPG"
								alt="logo이미지" onclick='location.href="main.do"'>
						</h1>
						<form action="logIn.do" method="post" name=frm>
							<hr style="color: grey; border-style: dotted">
							<table width="60%">
								<tr>
									<td><input type="email" class="form-control" id="Id"
										name="memberId" size="20" maxlength="20"
										required="required" placeholder="이메일" onblur="LoginChk()"></td>
								</tr>
								<tr>
									<td style="padding-left: 10px; font-size: 14px"><span
										class="span1"></span></td>
								</tr>
								<tr>
									<td><input type="password" class="form-control" id="pw"
										name="pw" size="20" maxlength="20" required="required"
										placeholder="비밀번호" onblur="LoginChk2()"></td>
								</tr>
								<tr>
									<td style="padding-left: 10px; font-size: 14px"><span
										class="span2"></span></td>
								</tr>
								<tr>
									<td>
										<hr style="color: gray; border-style: dotted">
									</td>
								</tr>
								<tr>
									<td>
									<input type="hidden" name="encPw" id="encPw" value="">
									<input type="hidden" name="encId" id="encId" value="">
									<input type="submit" value="로그인" class="btn loginBtn"></td>
								</tr>

								<tr>
									<td
										style="color: gray; padding-top: 20px; padding-bottom: 10px">원하는
										소셜계정으로 로그인</td>
								</tr>
								<tr>
									<td style="text-align: center">
									<a href="#" onclick="fbLoginAction();"> 
									<img	id="snsLogo"
											src="${pageContext.request.contextPath}/items/facebook.jpg"
											alt="페이스북이미지"></a> 
									<div id="gSignInWrapper" style="display: inline-block;">
									    <span id="customBtn" class="customGPlusSignIn">
									      	<img id="snsLogo" style="margin-left: 20px" src="${pageContext.request.contextPath}/items/google.png">
									    </span>
									</div>
									<a id="custom-login-btn" href="javascript:loginWithKakao()">
									<img id="snsLogo" style="margin-left: 20px" src="${pageContext.request.contextPath}/items/kakaolink_btn.png">
									</a>
											</td>
								</tr>
								<tr>
									<td><hr></td>
								</tr>
								<tr>
									<td style="text-align: center">
										<a href="pswFindForm.do">비밀번호찾기 </a> / <a href="joinForm.do">회원가입</a>
									</td>
								</tr>

							</table>
						</form>
					</center>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- 헤더 -->
	<div class="header_top">
		<!-- 로고 영역 -->
		<div class="container">
			<div class="logoArea">
				<img id="logo"
					src="${pageContext.request.contextPath}/items/logo2.JPG"
					alt="logo이미지" onclick='location.href="main.do"'>
			</div>

			<!-- 로그인 영역 -->
			<div class="loginArea">

				<!-- 로그아웃 상태 -->
				<c:if test="${loginChk == null || loginChk == 0}">
					<a href="joinForm.do" style="color: rgb(61,183,204); font-size: 15px; cursor: pointer;
						 				  margin-left: 10px; border: 1px solid rgb(61,183,204); padding: 3px 15px">회원가입</a>
					<a data-toggle="modal" data-target="#plogin" role="button"> 
					<span style="color: gray; font-size: 14px; cursor: pointer; margin-left: 10px;">로그인</span>
						<img id="user" src="${pageContext.request.contextPath}/items/user.png">
					</a>
				</c:if>
				<!-- 로그인 상태 -->
				<c:if test="${loginChk == 1 }">
					<a href="msgForm.do" data-toggle="tooltip" id="newMsg">
						<img src="${pageContext.request.contextPath}/items/message3.png" 
						     style="width: 50px; margin-right: 20px;">
					</a>
					<!-- Generated markup by the plugin -->
					<div class="tooltip bs-tooltip-top" role="tooltip">
					  <div class="arrow"></div>
					  <div class="tooltip-inner">
					  </div>
					</div>
					<img class="right" onclick="toggleUser()" id="loginLogo"
						src="${pageContext.request.contextPath}/images/${mbDto.mimg}"
						onerror="this.src='${pageContext.request.contextPath}/items/login.png'">
					<!-- 관리자 아님 -->
					<c:if test="${managerChk!=1}">
						<ul id="user_bar">
							<li style="float:left;">
							<img id="loginLogo" src="${pageContext.request.contextPath}/images/${mbDto.mimg}"
								 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'"></li>
							<c:if test="${guideChk ==1 }">
								<li id="user_bar_li" style="font-size: 12px">가이드</li>
							</c:if>
							<c:if test="${managerChk!=1 && guideChk!=1 }">
								<li id="user_bar_li" style="font-size: 12px">회원</li>
							</c:if>
							<br><li id="user_bar_li" style="margin-left: -35px"><b>${mbDto.nickName }</b></li>
							<li style="clear: both; padding-top:10px"><a href="user_info.do" style="font-size: 13px"><b><span style="color:rgb(61,183,204);">회원 》</span> 프로필관리</b></a></li>
							<hr style="margin-top:5px">
							<li><a href="wishList.do">
								<img src="${pageContext.request.contextPath}/items/wish2.png" style="width: 30px; margin: 0px 5px">
								위시리스트</a></li>
							<li><a href="reservation_member.do">
								<img src="${pageContext.request.contextPath}/items/suitcase2.png" style="width: 40px">
								나의 여행</a></li>
							<li><img src="${pageContext.request.contextPath}/items/coin1.png" style="width: 25px; margin: 0px 7.5px;">
 								${mbDto.mpoint }</li>
							<!-- 가이드가 아닐 때 -->
							<c:if test="${guideChk == null || guideChk == 0 }">
								<hr>
								<li ><a href="g_joinForm.do"><b>가이드 등록하기</b></a></li>
							</c:if>

							<!-- 가이드 일 때 -->
							<c:if test="${guideChk == 1 }">
								<li style="margin-top:30px;"><a href="profile_guide.do" style="font-size: 13px;">
									<b><span style="color:rgb(61,183,204);">가이드 》</span> 프로필관리</b></a></li>
								<hr style="margin-top:5px">
								<li><a href="service_guide.do">
									<img src="${pageContext.request.contextPath}/items/guiding1.png" style="width: 40px">
									나의 가이딩</a></li>
								<li><a href="inGServForm.do">
									<img src="${pageContext.request.contextPath}/items/guide.png" style="width: 30px; margin: 0px 5px">
									<b>가이딩 : 상품 등록</b></a></li>
							</c:if>
							<hr>
							<li style="text-align: right"><a href="logout.do">로그아웃</a></li>
						</ul>
					</c:if>
					<!-- 관리자 계정임 -->
					<c:if test="${managerChk==1 }">
						<ul id="user_bar">
							<li>${mbDto.nickName }
							<b>[ 관리자 ]</b></li>
							<li><a href="user_info.do" style="font-size: 13px"><b>프로필관리</b></a></li>
							<hr>
							<li><a href="mb_List.do">회원 관리</a></li>
							<li><a href="gd_manager.do">가이드 관리</a></li>
							<li><a href="service_manager.do">상품 관리</a></li>
							<li><a href="review_manager.do">후기 관리</a></li>
							<li><a href="noticeList.do">공지사항 관리</a></li>
							<li><a href="QA_manager.do">문의사항 관리</a></li>
							<hr>
							<li style="text-align: right"><a href="logout.do">로그아웃</a></li>
						</ul>
					</c:if>
				</c:if>
			</div>
			<!-- 검색영역 -->
			<div class="searchArea">
				<form action="search_Keyword.do" onsubmit="return patterChk()">
					<input type="text" class="search" name="keyword"
						placeholder="당신의 여행을 찾아보세요"></input> <input type="image"
						id="srch_img" name="submit"
						src="${pageContext.request.contextPath}/items/search1.png"
						value="" />
				</form>
			</div>
		</div>
	</div>

	<div class="navbar-header" id="category">
		<div class="container">
			<ul>
				<li class="category1 left" onclick="openCategory()">CATEGORY</li>
				<li class="category" onclick="location.href='notice.do'">NOTICE</li>
				<li class="category" onclick="location.href='fna.do'">FAQ</li>
				<li class="category" onclick="location.href='aboutUs.do'">ABOUT
					US</li>
				
				<!-- 인기검색어 -->
				<li style="float: right; display: inline-block;">
					<div class="block">
						<ul id="ticker">
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>



<form action="search_filter.do" class="hearderFrm">
		<input type="hidden" id="leadTime" name="gservLeadTime" />
		<div class="categoryList">
			<div class="list container">
				<div style="display: inline-block;">
					<span style="width: 250px; border-radius:0.5em; text-align:center; color:white; background-color: rgb(61,183,204); position: absolute; top: 40px; margin-left: 30px">지역별</span>
					<ul>
						<li><input type="radio" checked="checked" id="ac1" name="areaCode" value="01">
							<label for="ac1"><span></span>서울</label></li>
						<li><input type="radio" id="ac2" name="areaCode" value="02">
							<label for="ac2"><span></span>부산</label></li>
						<li><input type="radio" id="ac3" name="areaCode" value="03">
							<label for="ac3"><span></span>인천</label></li>
						<li><input type="radio" id="ac4" name="areaCode" value="04">
							<label for="ac4"><span></span>대구</label></li>
						<li><input type="radio" id="ac5" name="areaCode" value="05">
							<label for="ac5"><span></span>대전</label></li>
						<li><input type="radio" id="ac6" name="areaCode" value="06">
							<label for="ac6"><span></span>광주</label></li> 
						<li><input type="radio" id="ac7" name="areaCode" value="07">
							<label for="ac7"><span></span>울산</label></li>
						<li><input type="radio" id="ac8" name="areaCode" value="08">
							<label for="ac8"><span></span>강원도</label></li>
					</ul>
				</div>
				<div style="display: inline-block;">
					<ul>
						<br>
						<li><div style="margin: 20px 0 5px 0;"></div></li>
						<li><input type="radio" id="ac9" name="areaCode" value="09">
						<label for="ac9"><span></span>경기도</label></li>
						<li><input type="radio" id="ac10" name="areaCode" value="10">
						<label for="ac10"><span></span>충청북도</label></li>
						<li><input type="radio" id="ac11" name="areaCode" value="11">
						<label for="ac11"><span></span>충청남도</label></li>
						<li><input type="radio" id="ac12" name="areaCode" value="12">
						<label for="ac12"><span></span>경상북도</label></li>
						<li><input type="radio" id="ac13" name="areaCode" value="13">
						<label for="ac13"><span></span>경상남도</label></li>
						<li><input type="radio" id="ac14" name="areaCode" value="14">
						<label for="ac14"><span></span>전라북도</label></li>
						<li><input type="radio" id="ac15" name="areaCode" value="15">
						<label for="ac15"><span></span>전라남도</label></li>
						<li><input type="radio" id="ac16" name="areaCode" value="16">
						<label for="ac16"><span></span>제주도</label></li>
					</ul>
				</div>
				<div style="display: inline-block; margin-left: 50px">
					<span style="width: 250px; border-radius:0.5em; text-align:center; color:white; background-color: rgb(61,183,204); position: absolute; top: 40px; margin-left: 30px">테마별</span>
					<ul>
						<li><input type="checkbox" checked="checked" id="gs1" name="gservSub"
							value="명소"> <label for="gs1"><span></span>명소</label></li>
						<li><input type="checkbox" id="gs2" name="gservSub"
							value="음식"> <label for="gs2"><span></span>음식</label></li>
						<li><input type="checkbox" id="gs3" name="gservSub"
							value="이색"> <label for="gs3"><span></span>이색투어</label></li>
						<li><input type="checkbox" id="gs4" name="gservSub"
							value="문화"> <label for="gs4"><span></span>문화</label></li>
						<li><input type="checkbox" id="gs5" name="gservSub"
							value="자연"> <label for="gs5"><span></span>자연</label></li>
						<li><input type="checkbox" id="gs6" name="gservSub"
							value="액티비티"> <label for="gs6"><span></span>스포츠/액티비티</label>
						</li>
						<li><input type="checkbox" id="gs7" name="gservSub"
							value="야경"> <label for="gs7"><span></span>야경</label></li>
						<li><input type="checkbox" id="gs8" name="gservSub"
							value="쇼핑"> <label for="gs8"><span></span>쇼핑</label></li>

					</ul>
				</div>
				<div style="display: inline-block;">
					<ul>
						<li><input type="checkbox" id="gs9" name="gservSub"
							value="힐링"> <label for="gs9"><span></span>힐링</label></li>
						<li><input type="checkbox" id="gs10" name="gservSub"
							value="체험"> <label for="gs10"><span></span>체험</label></li>
						<li><input type="checkbox" id="gs11" name="gservSub"
							value="축제"> <label for="gs11"><span></span>축제</label></li>
						<li><input type="checkbox" id="gs12" name="gservSub"
							value="가족"> <label for="gs12"><span></span>가족여행</label></li>
						<li><input type="checkbox" id="gs13" name="gservSub"
							value="단체"> <label for="gs13"><span></span>단체여행</label></li>
						<li><input type="checkbox" id="gs14" name="gservSub"
							value="바다"> <label for="gs14"><span></span>바다</label></li>
						<li><input type="checkbox" id="gs15" name="gservSub"
							value="산"> <label for="gs15"><span></span>산</label></li>
						<li><input type="checkbox" id="gs16" name="gservSub"
							value="기차"> <label for="gs16"><span></span>기차</label></li>
					</ul>
				</div>
				<div style="display: inline-block; margin-left: 30px">
					<span style="width: 100px; border-radius:0.5em; text-align:center; color:white; background-color: rgb(61,183,204); position: absolute; top: 80px; margin-left: 30px">요일별</span>
					<ul>
						<li><input checked="checked" type="checkbox" id="gsd1" name="gservDay"
							value="D1"> <label for="gsd1"><span></span>월</label></li>
						<li><input checked="checked" type="checkbox" id="gsd2" name="gservDay"
							value="D2"> <label for="gsd2"><span></span>화</label></li>
						<li><input checked="checked" type="checkbox" id="gsd3" name="gservDay"
							value="D3"> <label for="gsd3"><span></span>수</label></li>
						<li><input checked="checked" type="checkbox" id="gsd4" name="gservDay"
							value="D4"> <label for="gsd4"><span></span>목</label></li>
						<li><input checked="checked" type="checkbox" id="gsd5" name="gservDay"
							value="D5"> <label for="gsd5"><span></span>금</label></li>
						<li><input checked="checked" type="checkbox" id="gsd6" name="gservDay"
							value="D6"> <label for="gsd6"><span></span>토</label></li>
						<li><input checked="checked" checked="checked" type="checkbox" id="gsd7" name="gservDay"
							value="D7"> <label for="gsd7"><span></span>일</label></li>
					</ul>
				</div>
				<div style="display: inline-block; margin-left: 60px">
				<input type="submit" class="sbmBttn" value="검색"> <br>
				<input type="button" class="sbmBttn"
					   onclick="closeCategory()" value="닫기">
				</div>
			</div>

		</div>
	</form>

</body>
<!-- 소셜로그인 스크립트 -->
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b24a9183b89e5f123d2fb212ebf6e317');

    // 카카오 로그인 버튼을 생성합니다.
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
    	throughTalk : false,
        persistAccessToken : false,
        success: function(authObj) {
        	Kakao.API.request({
        		  url: '/v1/user/me',
      			 success: function(res) {
        			 alert(JSON.stringify(res));
        			 var nickName = res.properties.nickname;
        			 var mimg = res.properties.profile_image;
        			 var memberId = res.kaccount_email; 
        			 
        			 $.ajax({
      					data : {
      						memberId : memberId,
      						mimg : mimg,
      						nickName : nickName
      					},
      					url : "${pageContext.request.contextPath}/shCon/kakaoLogin.do",
      					success : function(data) {
      						alert("성공");
      						location.href="kakaoLogIn.do?memberId="+data['memberId'];
      					}
      				});
        		 },
        		 fail: function(err){
        			 alert(JSON.Stringify(err));
        		 }
        	  });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
    $('#logout').click(function(){
    	Kakao.Auth.logout(
    			function(obj) {
    			if(obj==true){
    				setTimeout(function(){
	  		        location.href='logout.do';
	  		            });
    			}else{}
    			});
    });
  //]]>
</script>
<script type="text/javascript">
$(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "https://connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function() {
	FB.init({
		appId : '2121474918075282',
		cookie : true,
		xfbml : true,
		version : 'v2.12'
	});

	FB.AppEvents.logPageView();

	FB.getLoginStatus(function(response) {
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status === 'connected') {
			$('#result').append("status : connected");
		} else {
			$('#result').append(response);
		}
	});

}

function fbLoginAction() {
	FB.login(function(response) {
		var fbname;
		var accessToken = response.authResponse.accessToken;
		FB.api('/me?fields=id,name,email,picture', function(response) {
			var fb_data = jQuery.parseJSON(JSON.stringify(response));
			var data = '<br/>fb_id : ' + fb_data.id;
			data += "<br/>email : " + fb_data.email;
			data += "<br/>name : " + fb_data.name;
			data += "<br/>picture : " + fb_data.picture.data.url;
			var nickName = fb_data.name;
 			var mimg = fb_data.picture.data.url;
 			var memberId = fb_data.email;
 			 $.ajax({
					data : {
						memberId : memberId,
						mimg : mimg,
						nickName : nickName
					},
					url : "${pageContext.request.contextPath}/shCon/kakaoLogin.do",
					success : function(data) {
						alert("성공");
						location.href="kakaoLogIn.do?memberId="+data['memberId'];
					}
				});
		});
	}, {
		scope : 'public_profile, email'
	});
}
$('#logout').click(function(){
	FB.logout(function(response) {
		alert("로그아웃")
	});
});
</script>
<script type="text/javascript">
	function toggleUser() {
		$('#user_bar').toggle();
	};
	
	function openCategory() {
		$('.categoryList').toggle();
	};
	
	function closeCategory() {
		$('.categoryList').hide();
	};
	
	function patterChk() {
		var pattern = /([^가-힣\x20])/i;
		//var fld = "가나다라마사"; 
		var fld = $('input[name=keyword]').val();
		if (pattern.test(fld)) {
			alert("한글이 아닙니다. (자음, 모음만 있는 한글은 처리하지 않습니다.)");
			return false;
		}
	}
	
	var id = null;
	
	function LoginChk() {
		var memberId1 = document.getElementById("Id").value;
		$.ajax({
			data : {
				memberId : memberId1
			},
			url : "${pageContext.request.contextPath}/fs.do",
			success : function(data) {
				if (data == '1') {
					$(".span1").text("아이디가 맞습니다.").css("color", "#ff0000");
					id = memberId1;
				} else if (data == '0') {
					$(".span1").text("아이디를 찾을수 없습니다.").css("color", "#ff0000");
				}
			}
		})
	}
	
	function LoginChk2() {
		var memberId1 = document.getElementById("Id").value;
		var pw1 = document.getElementById("pw").value;
		
				$.ajax({
					data : {
						memberId : memberId1,
						pw : pw1
					},
					url : "${pageContext.request.contextPath}/checkpsw.do",
					success : function(data) {
						if (data == 1) {
							$(".span2").text("패스워드가 맞습니다.").css("color",
									"#ff0000");
						} else if (data == 0) {
							$(".span2").text("패스워드를 찾을수 없습니다.").css("color",
									"#ff0000");
						}
					}
				})
	
	}
	
	$(function()
			{
			    var ticker = function()
			    {
			        setTimeout(function(){
			            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
			            {
			                $(this).detach().appendTo('ul#ticker').removeAttr('style');
			            });
			            ticker();
			        }, 3000);
			    };
			    ticker();
			});
	
	
	$(function () {
		  $('a[data-toggle="tooltip"]').tooltip();
	});

</script>

<script type="text/javascript">

		var googleUser = {};
		var startApp = function() {
		  gapi.load('auth2', function(){
		    // Retrieve the singleton for the GoogleAuth library and set up the client.
		    auth2 = gapi.auth2.init({
		      client_id: '865124443199-l6mksejbe88dbvj2u6jlmg7e79ocbl0j.apps.googleusercontent.com',
		      cookiepolicy: 'single_host_origin',
		      // Request scopes in addition to 'profile' and 'email'
		      //scope: 'additional_scope'
		    });
		    attachSignin(document.getElementById('customBtn'));
		  });
		};
		
		function attachSignin(element) {
		  console.log(element.id);
		  auth2.attachClickHandler(element, {},
		      function(googleUser) {
		  	  googleUser.grant ({scope :' https://www.googleapis.com/auth/contacts.readonly' });
		        var nickName = googleUser.getBasicProfile().getName();
		        var memberId = googleUser.getBasicProfile().getEmail();
		        var mimg = googleUser.getBasicProfile().getImageUrl();
		        $.ajax({
					data : {
						memberId : memberId,
						mimg : mimg,
						nickName : nickName
					},
					url : "${pageContext.request.contextPath}/shCon/kakaoLogin.do",
					success : function(data) {
						alert("성공");
						location.href="kakaoLogIn.do?memberId="+data['memberId'];
					}
				});
		  }, function(error) {
		        alert(JSON.stringify(error, undefined, 2));
		      });
		}
		startApp();
		/* $('#logout').click(function(){
			auth2.disconnect();
		}); */
</script>
</html>