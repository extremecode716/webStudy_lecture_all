<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	caption {
		caption-side: top;
	}
	.card {
		min-width: 445px;
		max-width: 445px;
	}
	#servImg {
		width: 443px;
		height: 270px;
	}
		
</style>
<script type="text/javascript">
	$(document).ready(function(){		
		$( "input[name=reMemSize]" ).blur(function() {
			 $('#price').val("￦"+($(this).val()*${tcDto.gservPrice}).toLocaleString());
		     return false;
		});
	});
	$(document).ready(function(){	
		$('#price').val("￦"+($('#price').val()).toLocaleString());		
	});
	
	
	$(function(){
		var min = ${tcDto.gservSDate};
		var max = ${tcDto.gservEDate};
		minYear = min.substr(0,4);
		minMonth = min.substr(4,2);
		minDay = min.substr(6,2);
	    maxYear = max.substr(0,4);
	    maxMonth = max.substr(4,2);
		maxDay = max.substr(6,2);
	    
	    $("#date1").datepicker({
	    	minDate: new Date(minYear, minMonth, minDay);
	    	maxDate: new Date(maxYear, maxMonth, maxDay);
	    	dateFormat: "yy-mm-dd",
			regional: "ko",
			beforeShowDay: function(date){
				var day = date.getDay();		
				return [(${tcDto.gservDay})];	    	
			    // return [(day != 0 && day != 1 && day != 3 && day != 4 && day != 6)];			
 			}
		});
	});
	
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<form action="upResvPro.do">
<input type="hidden" name="payCode" value="${resvDto.payCode }">
<div class="container">
<center>
	<div style="margin-top: 30px; margin-bottom: 30px">
		<h2>[ ${tcDto.gservTitle } ] 예약 정보 </h2>
		<hr>
		<br>
	</div>
</center>
	
<div class="row">	
<div class="col-md-5">
	<div class="card">
		<img id="servImg" src="${pageContext.request.contextPath}/images/${tcDto.imgSrc }" 
			 onerror="this.src='${pageContext.request.contextPath}/items/itemPic1.png'">
		<div class="card-body">
			<h5 class="card-title">${tcDto.gservTitle }</h5>
			${tcDto.nickName }
			<p class="card-text">${tcDto.servTag}
		</div>	
	</div>
</div>	
<div class="col-md-7">	
	<table class="table">
		<caption>예약 정보</caption>
		<tr>
			<td>예약자 EMAIL(ID)</td>
			<td>${resvDto.memberId }</td>
		</tr>
		<tr>
			<td>예약 번호</td>
			<td>${resvDto.payCode }</td>
		</tr>		
		<tr>	
			<td>예약 인원</td>
			<td><input type="number" class="form-control" name="reMemSize" value="${resvDto.reMemSize }" required="required"></td>
		</tr>
		<tr>	
			<td>투어예정일</td>
			<td><input type="text" size="12" readonly="readonly" class="form-control" id="date1" name="tourDate" value="${resvDto.tourDate }" required="required"></td>
		</tr>
		<tr>
			<td>총 가격</td>
			<td>
			<input type="text" id="price" class="form-control" min="0" value="${tcDto.gservPrice*resvDto.reMemSize }" readonly="readonly">
			<%-- <fmt:formatNumber value = "${tcDto.gservPrice*resvDto.reMemSize }" type="currency" currencySymbol="\\"/>  --%>
			</td>
		</tr>
		<tr>
			<td>확정여부</td>
			<c:if test="${resvDto.confirm =='n' || resvDto.confirm =='N' }">		
				<td style="color:blue">미확정</td>
			</c:if>
			<c:if test="${resvDto.confirm =='y' || resvDto.confirm =='Y' }">
				<td style="color:red">확정</td>
			</c:if>
		</tr>		
	</table>	
	</div>
  </div>
	<center style="margin-top: 30px">
			<input type="submit" class="btn btn-info" value="예약하기">
			<input type="button" class="btn btn-info" value="취소" onclick="location.href='reservation_member.do'">
	</center>
</div>
</form>
</body>
</html>