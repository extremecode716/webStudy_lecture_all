<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b24a9183b89e5f123d2fb212ebf6e317&libraries=services"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.topImg {
		width: 100%;
		height: 400px;
		overflow:hidden;
		position: relative;
	}
	.cityImg {
		position: absolute;
		left : -100%;
		right : -100%;
		top: -100%;
		bottom: -100%;
		margin: auto;
		min-height: 100%;
		min-width: 100%;
	}
	
	.movingNav {
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		width: 100%;
		height: 50px;
		color: #353535;
	}
	#date1:hover {
		cursor: pointer;
	}
	.movingNav li a:hover {
		border-bottom: 3px solid rgb(61,183,204);
		cursor: pointer;
	}

	#gImg {
		width: 80px;
		height: 80px;
		border-radius: 40px;
	}
	#gservImages {
		width: 800px;
		box-shadow: 5px 5px 10px gray;
		padding: 20px 0px;
	}
	
	#gservImages #big {
		width: 710px;
		height: 400px;
		padding-bottom: 4px;
	}
	#gservImages #small {
		width: 100%;
		height: 150px;
		float:left;
	}
	#img-sm {
		width: 234px;
		display: inline-block;
	}
	
	.darkImg {
		opacity: 0.3;
		position: relative;
	}
	
	#more_Img {
		 position: absolute;
		 padding: 58px 68px;
	     font-size: 18px;
	     color: white;
	     z-index: 2;
	     text-align: center;
	}
	.popup_open {
		background-color: black;
	}	
	#popup_wrap {
	width: 700px;
	height: 500px;
	background: #fff;
	border: solid 1px #666666;
	position: fixed;
	top: 50%;
	left: 45%;
	margin: -250px 0 0 -250px;
	z-index: 9999;
	display: none;
	}

	#mask {
		width: 100%;
		height: 100%;
		position: fixed;
		background: rgba(0, 0, 0, 0.7) repeat;
		top: 0;
		left: 0;
		z-index: 2000;
		display: none;
	}
	
	.popup-cont01 {
		width: 600px;
		height: 400px;
		margin: 40px auto;
		text-align: center;
	}
	.popup-cont01 img{
		height: 400px;
	}
	.popup-cont01 button {
		width: 138px;
		height: 36px;
		line-height: 36px;
		background: #9f2f60;
		color: #ffffff;
		text-align: center;
		border: none;
		font-size: 16px;
	}
	#servImgIndicator img {
		height: 450px;
	}
	
	ul, li {
		padding : 0px;
	}
</style>
<script type="text/javascript">

	$(document).ready(function () {
		var container = document.getElementById('map');
		var gservGps = "${gsDto.gservGps}";
		var gps = gservGps.split(",");
		var lat = gps[0];
		var lng = gps[1];
		var options = {
			center : new daum.maps.LatLng(lat, lng),
			level : 3
		};
		
		var map = new daum.maps.Map(container, options);
		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(lat, lng);
				
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	});
	
	
	// 예약 확인
	function chkResv() {
		if($("#date1").val() == null || $("#date1").val() == ""){
			alert("날짜를 선택해주세요");
			location.href="#date1";	
			return false;
		}
		if($("#reMemSize").val() == null){
			alert("인원을 선택해주세요");
			location.href="#reMemSize";
			return false;
		}
		if(confirm("예약하시겠습니까?")){
			return true;
		}
		else {return false; }
	}

	// 위시리스트 등록 */
	function inWishList(VgservNo){
		if(${ID==null || ID.equals("")}){
			alert("로그인이 필요합니다!");
			location.href="#plogin";
			return false;
		}
		
		$.ajax({
			url:"<%=context%>/inWishList.do",  
			data:{gservNo : VgservNo},
			dataType:'text',
			success:function(data){
				 $('#wishChk').text(data); 
			}
		});
	}

	// 예약 가능 날짜 셋팅
	$(function(){
		var min = "${gsDto.gservSDate}";
		var max = "${gsDto.gservEDate}";
		minYear = min.substr(0,4);
		minMonth = min.substr(4,2);
		minDay = min.substr(6,2);
	    maxYear = max.substr(0,4);
	    maxMonth = max.substr(4,2);
		maxDay = max.substr(6,2);
		
	    $("#date1").datepicker({
			minDate: new Date(minYear, minMonth, minDay),
	    	maxDate: new Date(maxYear, maxMonth, maxDay),
	    	dateFormat: "yy-mm-dd",
			regional: "ko",
			beforeShowDay: function(date){
				var day = date.getDay();		
				return [(${gsDto.gservDay})];	    	
			    // return [(day != 0 && day != 1 && day != 3 && day != 4 && day != 6)];			
 			}
		})
	})
	
	$(document).ready(function() {
		$(".popup_open").click(function() {
			$("#popup_wrap").css("display", "block");
			$("#mask").css("display", "block");
		});
	});
	
	$(document).ready(function() {
		$(".popup_open").click(function() {
			$("#popup_wrap").css("display", "block");
			$("#mask").css("display", "block");
		});
		$("#popup_close").click(function() {
			$("#popup_wrap").css("display", "none");
			$("#mask").css("display", "none");
		});
	});
	
	/* // 총 금액 구하기
	$(function(){
		var price = "${gsDto.gservPrice}";
		var memberSize = "";
		var resultPrice = "";
		$("#reMemSize").blur({		
			memberSize = $("#reMemSize").val();
			resultPrice = price * memberSize;
			$("#resultPrice").text(resultPrice)
		});		
	});
 */
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="container" style="height: 30px; font-size: 15px; padding-top: 3px">
<!-- top -->
	<a href="search_filter.do?areaCode=${gsDto.gservArea }" style="color:rgb(61,183,204);">
		<img src="${pageContext.request.contextPath}/items/loc2.png" width="20px"> 
		${gsDto.areaName } <b>》</b>
	</a> ${gsDto.gservTitle }
</div>
<div class="topImg">
	<img class ="cityImg" alt="여행이미지" src="${pageContext.request.contextPath}/images/${cDtoList[1].imgSrc }">
</div>

<!-- 네비게이션 -->
<div class="movingNav">
	<div class="container">
		<ul style="display:inline-block; font-size: 18px; margin-top:10px">
			<li style="display:inline-block;">
				<a href="#introTour" style="color: #353535; margin-left: 80px; padding: 10px 40px;">여행 소개</a>
			</li>
			<li style="display:inline-block;">
				<a href="#course" style="color: #353535; padding: 10px 40px;">코스 소개</a>
			</li>
			<li style="display:inline-block;">
				<a href="#review" style="color: #353535; padding: 10px 40px;">후기</a>
			</li>
		</ul>
		<a style="margin-left: 50px; height:30px; width: 150px; padding:0; 
					   margin-top:7.5px; margin-right: 30px; float: right" 
					   class="btn btn-info" href="#date1">예약하기</a>
	</div>
</div>
<div class="container">
<div class="row">
	<div class="col-md-9">
	<!-- 간단 info -->
	<c:set var="gs" value="${gsDto}"></c:set>
		<h3 style="margin-top:25px"><b>${gs.gservTitle}</b></h3>
		<h6 style="color:gray">${gs.areaName }</h6>
		<h6 style="color:rgb(61,183,204); font-size: 16px">${gs.servTag}</h6>
		<hr>
		<div>
			<ul style="text-align: center;">
				<li style="display: inline-block; font-size: 18px">
					<img src="${pageContext.request.contextPath}/items/pickUp.png" style="width:46px; height: 40px; margin-bottom: 10px">
					<br><span style="font-size:15px; color: #353535">픽업시간</span>
					<br> ${gs.pickUpTime }</li>
				<li style="display: inline-block; margin-left: 100px; font-size: 18px">
					<img src="${pageContext.request.contextPath}/items/language.png" width="70px" height="65px">
					<br><span style="font-size:15px; color: #353535">언어</span>
					<br> ${gs.gservLang }</li>
				<li style="display: inline-block; margin-left: 100px; font-size: 18px">
					<img src="${pageContext.request.contextPath}/items/hourglass.png" style="width:50px; height: 44px; margin-bottom: 10px">
					<br><span style="font-size:15px; color: #353535">소요시간</span>
					<br>${gs.gservLeadTime }</li>
			</ul>
		</div>
		<hr>

		<!-- 예약 form -->
			<form action="inResvPro.do" method="post" onsubmit="return chkResv()">
				<input type="hidden" name="gservNo" value="${gs.gservNo }">
				<input type="hidden" name="gno" value="${gs.gno }">
				<div style="width: 100%; height: 150px; margin: auto; 
					        border: 1px solid lightgray; padding: 30px;">
					<h5 style="margin-bottom: 20px"><b>날짜와 인원을 선택하세요.</b></h5>
		            <center>
			            <input type="text" size="12" readonly="readonly" class="form-control" id="date1" 
			            	   name="tourDate" style="width: 270px; height: 35px; display: inline-block;" 
			            	   required="required" placeholder="날짜 선택">
			            	   
						<select required="required" name="reMemSize" id="reMemSize" 
								style="width: 150px; height: 35px; border-radius: 0.5em">
							<c:forEach var="i" begin="1" end="20">
								<option value="${i}">&nbsp&nbsp${i}인</option>
							</c:forEach>
						</select>
						<input type="submit" class="btn btn-info" style="height: 35px; 
						        margin-left: 20px; width: 120px;" value="예약하기">
						
					<span id="resultPrice"></span>
					</center>
				</div>
			</form>

		<!-- 가이드 소개 -->
		<div style="margin-top: 50px; margin-bottom: 100px;">
			<div>
				<img id="gImg" src="${pageContext.request.contextPath}/images/${gDto.gimg}"
					 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'">
				<span style="margin-left: 15px">${gDto.nickName }</span>
				<a  class="btn" 
					href="inQAForm.do?qaReceiver=${gDto.memberId }&gservNo=${gsDto.gservNo}&memberId=${ID}" 
				    style="background-color: white; border: 1px solid gray; 
				           padding: 0px 30px; float: right; margin-right: 20px">
				<img src="${pageContext.request.contextPath}/items/message.png" style="width: 25px; height: 20px">
				  문의하기               
				</a>
				<br>
				<hr>
				<pre>${gDto.ginfo }</pre><br>
				<hr>
				<a href="author_detail.do?gno=${gsDto.gno }">프로필 보기 》</a>
			</div>
		</div>
		
		<!-- 상품 소개 -->
		<div style="margin-top: 50px; margin-bottom: 100px;">
			<h4 id="introTour"><b>상품 소개</b></h4>
			<br>
			<p><pre>${cDtoList[0].gservIntro }</pre></p>		
		</div>
		
		
		<!-- 상품 이미지 모음 -->

		<div id="gservImages">
		<center>
			<ul>
				<!-- 이미지 4개 이상 -->
				<c:if test="${cDtoList.size() >= 5 }">
					<c:forEach var="cDto" items="${cDtoList }" varStatus="status">
						<c:choose>
						 <c:when test="${status.index eq 0}">
		  
		   				 </c:when>
						 <c:when test="${status.index eq 1}">
		      				<li>
							<img id="big" src="${pageContext.request.contextPath}/images/${cDto.imgSrc}"></li>
		   				 </c:when>
						 <c:when test="${status.index eq 2 || status.index eq 3}">
		      				 <li id="img-sm">
							 <img id="small" src="${pageContext.request.contextPath}/images/${cDto.imgSrc}"></li>
		   				 </c:when>
						 <c:when test="${status.index eq 4}">
		      				 <li id="img-sm" class="popup_open">
			      				 <div style="position: relative;">
			      				 <a href="#none">
								 	<img id="small" class="darkImg" src="${pageContext.request.contextPath}/images/${cDto.imgSrc}">
			   				 	 </a>	
			      				 </div>
			   				 	 <div id="more_Img">
			   				 	 <a href="#none" style="color: white; width: 100%">
			   				 	 		+ 더 보기(${cDtoList.size() }) 
			   				 	 </a>
			   				 	 </div>
		   				 	 </li>
		   				 </c:when>
					</c:choose>
					</c:forEach>
				</c:if>
				
				<!-- 이미지 4개 이하 -->
				<c:if test="${cDtoList.size() < 5 }">
						<div style="width:100%;">
						<div id="servImgIndicator" class="carousel slide" data-ride="carousel">
						  	<ol class="carousel-indicators">
						  	<c:forEach var="i" begin="1" end="${cDtoList.size()-1 }">
						  		<c:if test="${i==1 }">
						    		<li data-target="#servImgIndicator" data-slide-to="${i }" class="active"></li>
						  		</c:if>
								<c:if test="${i!=1 }">
						    		<li data-target="#servImgIndicator" data-slide-to="${i }"></li>
								</c:if>					  	
						  	</c:forEach>
							</ol>
							
						  <div class="carousel-inner">
							<c:forEach var="cDto" items="${cDtoList }" varStatus="status">
							    <c:choose>
						 			<c:when test="${status.index eq 0}">
					   				 </c:when>
						 			<c:when test="${status.index eq 1}">
									    <div class="carousel-item active">
									      <img class="d-block w-100" src="${pageContext.request.contextPath}/images/${cDto.imgSrc }" alt="Image slide">
									    </div>
					   				 </c:when>
					   				 <c:otherwise>
						   				 <div class="carousel-item">
									       <img class="d-block w-100" src="${pageContext.request.contextPath}/images/${cDto.imgSrc}" alt="Image slide">
									    </div>		
					   				 </c:otherwise>
		      					</c:choose>
							</c:forEach>
						  </div>
						  <a class="carousel-control-prev" href="#servImgIndicator" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#servImgIndicator" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
					    </div>
					    </div>
				</c:if>
			</ul>
		</center>
		</div>
		
	
		<!-- 코스 소개 -->
		<div style="clear: both; padding-top: 100px">
		<h4 id="course" style="margin-bottom: 50px">
		<b>코스 소개</b>
		</h4>
			
			<c:forEach var="cDto" items="${cDtoList }">
				<table id="introCourse" height="250px" style="margin-top: 10px; margin-bottom: 40px;">
					<c:if test="${cDto.gservOrder ==0 }">
						<tr>
							<td width="3%"></td>
							<td width="3%" style="border-left: 1px solid rgb(61,183,204)"></td>
							<td><b>만나는 장소</b></td>
							<td><b>만나는 시간</b></td>
						</tr>
						<tr>
							<td width="3%"></td>
							<td width="3%" style="border-left: 1px solid rgb(61,183,204)"></td>
							<td style="padding: 10px"><small>${cDto.introTitle }이대역 2번 출구 앞</small></td>
							<td style="padding: 10px"><small>${gsDto.pickUpTime }</small></td>
						</tr>
						<tr>
							<td width="3%"></td>
							<td width="3%" style="border-left: 1px solid rgb(61,183,204)"></td>
							<td width="47%">
								<div id="map" style="width: 100%; height: 250px;"
									 class="form-control"></div>
							</td>
							<td>
								<img src="${pageContext.request.contextPath}/images/${cDto.imgSrc}" style="width: 387px; height: 250px; border-radius: 0.5em">
							</td>
						</tr>
					</c:if>
					<c:if test="${cDto.gservOrder!=0}">
						<tr>
							<td width="6%" colspan=2>
							<center>
							<img src="${pageContext.request.contextPath}/items/loc.png"
												style="width: 30px"></center>
							</td>
							<td width="47%"><b>${cDto.introTitle }타이틀르를르르르르</b></td>
							<td width="47%" rowspan="2"><img src="${pageContext.request.contextPath}/images/${cDto.imgSrc}" style="width: 387px; height: 250px; border-radius: 0.5em"></td>
						</tr>
						<tr>
							<td width="3%"></td>
							<td width="3%" style="border-left: 1px solid rgb(61,183,204)"></td>
							<td style="padding: 20px"><pre>${cDto.gservIntro }</pre></td>
						</tr>
					</c:if>
				</table>
			</c:forEach>
			</div>
	
	<!-- 왼쪽 col-md-9 끝 -->		
	</div>
	
	
	<!-- 오른쪽 사이드 바 -->
	<div class="col-md-3">
		<div style="width: 100%; height: 100px; background-color: #EAEAEA; margin: 30px 0px; padding: 27px 35px">
			<span style="font-size: 30px; font-stretch: 20px">
				<fmt:formatNumber value = "${gs.gservPrice }" type="currency" currencySymbol="￦"/>
			</span>/ 1인
		</div>
		<!-- 위시리스트 등록 여부 -->	
		<div style="width: 100%; padding: 30px 0px; height: 100px; margin: auto;" >
			<center>
				<c:if test="${wishCheck > 0 }">
					<h6 style="text-align: center; margin-top:10px">위시리스트에 등록된 상품입니다.</h6>
				</c:if>
				<c:if test="${wishCheck ==0 }">	
					<p id="wishChk" style="border: 2px solid rgb(254,153,0); width: 200px; border-radius: 0.5em">
						<img src="${pageContext.request.contextPath}/items/heart3.png" style="width: 30px; display: inline-block;">
						<input type="button" value="위시리스트 등록" class="btn" 
						       style="height:40px; background-color:white; color:#A56100" 
						       onclick="inWishList(${gs.gservNo})">	
					</p>
				</c:if>
			</center>
		</div>
		<div style="padding: 20px 20px; margin-top:30px; border: 1px solid lightgray">
			<h6><b>투어가능인원</b></h6>
			<p>${gs.memSizeMin }명 ~ ${gs.memSizeMax }명 </p>
			<hr>
			<h6><b>가격포함사항</b></h6>
			<p>${gs.pinclude}</p>
			<hr>
			<h6><b>가격불포함사항</b></h6>
			<p>${gs.notPInclude}</p>
			<hr>
			<h6><b>주의사항</b></h6>
			<p>${gs.caution}</p>		
		</div>
	</div>
	
<!-- row div 끝	 -->	
</div> 
		
		<!-- 후기 소개 -->
		<div id="review">
		<h4 style="margin-top: 120px; margin-bottom: 50px"><b>후기 ${totalRevs }</b></h4>
			
			<!-- 후기가 없을 때 -->
			<c:if test="${totalRevs == 0 }">
				<hr>
				<h5 style="color: gray">당신이 이 가이딩의 첫 번째 후기를 작성해보세요!</h5> 
			</c:if>
			
			<!-- 후기가 있을 때 -->
			<c:if test="${totalRevs != 0 }">
			<c:forEach var="revDto" items="${revDtoList }">
				<ul style="width: 60%; margin-top: 50px;">
					<!-- 메인 후기 -->
					<c:if test="${revDto.rstep == 0 }">
						<li><h5><b>${revDto.rtitle }</b></h5></li>
						<li style="display: inline-block; color: #353535">${revDto.nickName }<span style="font-size: 10px; color:#353535; margin: 0px 10px">●</span></li>
						<li style="display: inline-block; color:rgb(61,183,204); font-size: 13px"><c:forEach var="i" begin="1" end="${revDto.rstar }">
								★
							</c:forEach></li>
						<li style="display: inline-block; color: #353535"><span style="font-size: 10px; color: #353535; margin: 0px 10px">●</span>  ${revDto.rcredate }</li>
						<li><hr></li>
						<li style="margin-bottom: 50px;">${revDto.rcontent }</li>
						
						<!-- 후기 이미지 셋팅 -->
						<div style="width:70%">
						<div id="revImgIndicator" class="carousel slide" data-ride="carousel">
						  	<ol class="carousel-indicators">
						  	<c:forEach var="i" begin="0" end="${ fn:length(revDto.rimgs)-1 }">
						  		<c:if test="${i==0 }">
						    		<li data-target="#carouselExampleIndicators" data-slide-to="${i }" class="active"></li>
						  		</c:if>
								<c:if test="${i!=0 }">
						    		<li data-target="#carouselExampleIndicators" data-slide-to="${i }"></li>
								</c:if>					  	
						  	</c:forEach>
							</ol>
							
						  <div class="carousel-inner">
							<c:forEach var="rImgs" items="${revDto.rimgs }">
							    <c:if test="${rImgs == revDto.rimgs[0] }">
								    <div class="carousel-item active">
								      <img class="d-block w-100" src="${pageContext.request.contextPath}/images/${rImgs }" alt="Image slide">
								    </div>
							    </c:if>
								<c:if test="${rImgs != revDto.rimgs[0] }">
								    <div class="carousel-item">
								      <img class="d-block w-100" src="${pageContext.request.contextPath}/images/${rImgs }" alt="Image slide">
								    </div>								
								</c:if>
							</c:forEach>
						  </div>
						  <a class="carousel-control-prev" href="#revImgIndicator" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#revImgIndicator" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
					    </div>
					    </div>
					</c:if>	
												
					<!-- 코멘트 -->
					<c:if test="${revDto.rstep != 0 }">
						<li style="margin-top: 30px;"><b>┗ &nbsp&nbsp&nbsp</b>${revDto.rcontent }</li>
						<li style="float:right; width: 150px; display: inline-block;"><b style="color:rgb(61,183,204)">BY</b> ${revDto.nickName }</li>
						<li style="float:right; width: 150px; display: inline-block;"><b style="color:rgb(61,183,204)">DATE</b> ${revDto.rcredate }</li>
						<li style="clear: both"></li>
					</c:if>
				</ul>
			</c:forEach> 
		</c:if>
		</div>
		
		
		
<!-- container div -->
</div>
<div style="clear: both">
<br>
<br>
<br>
</div>
	<jsp:include page="footer.jsp"></jsp:include>	

		
		<!-- 팝업 이미지 레이어 -->
		<div id="popup_wrap">
		<div class="popup-cont01">
			<div id="servImgIndicator1" class="carousel slide" data-ride="carousel">
						  	<ol class="carousel-indicators">
						  	<c:forEach var="i" begin="0" end="${cDtoList.size()-1 }">
						  		<c:if test="${i==0 }">
						    		<li data-target="#servImgIndicator1" data-slide-to="${i }" class="active"></li>
						  		</c:if>
								<c:if test="${i!=0 }">
						    		<li data-target="#servImgIndicator1" data-slide-to="${i }"></li>
								</c:if>					  	
						  	</c:forEach>
							</ol>
							
						  <div class="carousel-inner">
							<c:forEach var="cDto" items="${cDtoList }" varStatus="status">
							    <c:choose>
						 			<c:when test="${status.index eq 0}">
									    <div class="carousel-item active">
									      <img class="d-block w-100" src="${pageContext.request.contextPath}/images/${cDto.imgSrc }" alt="Image slide">
									    </div>
					   				 </c:when>
					   				 <c:otherwise>
						   				 <div class="carousel-item">
									       <img class="d-block w-100" src="${pageContext.request.contextPath}/images/${cDto.imgSrc}" alt="Image slide">
									    </div>		
					   				 </c:otherwise>
		      					</c:choose>
							</c:forEach>
						  </div>
						  <a class="carousel-control-prev" href="#servImgIndicator1" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#servImgIndicator1" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
			</div>
		</div>
		</div>
			
		<div id="mask">
			<a id="popup_close" style="position: fixed; top: 30px; right: 60px;">
				<img src="${pageContext.request.contextPath}/items/close1.png"
			         style="width: 60px">
			</a>
		</div>


	

</body>
</html>