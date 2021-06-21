<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.card {
		min-width: 445px;
		max-width: 445px;
	}	
	#servImg {
		width: 443px;
		height: 270px;
	}
</style>
</head>
<body>
<div class="container">
	  <div style="margin-top: 70px; margin-bottom: 50px">
		<h2>[ ${tcDto.gservTitle } ] 예약 정보 </h2>
		<br>
		<hr>
	  </div>
<div class="row">
	<div class="col-sm-6">
		<div class="card">
			<img id="servImg" src="${pageContext.request.contextPath}/images/${tcDto.imgSrc }" 
				 onerror="this.src='${pageContext.request.contextPath}/items/itemPic1.png'" >
			<div class="card-body">
				<h5 class="card-title">${tcDto.gservTitle }</h5>
				${tcDto.nickName }
				<p class="card-text">${tcDto.servTag }
			</div>	
		</div>
	</div>
	<div class="col-sm-6">
	<table class="table">
		<caption style="caption-side: top">
			예약 정보
		</caption>
		<tr>
			<td>예약자 EMAIL(ID)</td>
			<td>${resvDto.memberId }</td>
		</tr>
		<tr>
			<td>예약 번호</td>
			<td>${resvDto.payCode }</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${tcDto.gservTitle }</td>
		</tr>
		<tr>
			<td>예약인원</td>
			<td>${resvDto.reMemSize }</td>
		</tr>
		<tr>
			<td>투어예정일</td>
			<td>${resvDto.tourDate }</td>
		</tr>
		<tr>
			<td>총 가격</td>
			<td><fmt:formatNumber value = "${tcDto.gservPrice*resvDto.reMemSize }" type="currency" currencySymbol="￦"/></td>
		</tr>
		<tr>
			<td>확정여부</td>
			<td>${resvDto.confirm }</td>
		</tr>
	</table>
	<div style="width: 500px; margin: auto; margin-top: 30px; text-align: center">
			<input type="button" class="btn btn-info" value="결제하기" onclick="location.href='inPayForm.do?payCode=${resvDto.payCode }'">
			<input type="button" class="btn btn-info" value="MyPage" onclick="location.href='reservation_member.do'">
			<input type="button" class="btn btn-info" value="HOME" onclick="location.href='main.do'">
	</div>
	</div>
</div>

	
</div>
</body>
</html>