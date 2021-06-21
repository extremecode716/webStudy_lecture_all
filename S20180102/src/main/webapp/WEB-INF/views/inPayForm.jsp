<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body {
		padding-top: 70px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		var IMP = window.IMP; // 생략가능
		IMP.init('imp42233092'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
		$( "#pay" ).click(function() {
			var pay_method1 = $('input[name=pay_method]:checked').val();
			var buyer_email1 = $('#buyer_email').val();
			var buyer_name1 = $('#buyer_name').val();
			var buyer_tel1 = $('#buyer_tel').val();
			var buyer_addr1 = $('#buyer_addr').val();
			var amount1 = $('#amount').val();
			var discount = $('#discount').val();
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : pay_method1,
			    merchant_uid : '${resvDto.payCode }',
			    name : '[결제 상품]${resvDto.gservTitle}',
			    amount : amount1,
			    buyer_email : buyer_email1,
			    buyer_name : buyer_name1,
			    buyer_tel : buyer_tel1,
			    buyer_addr : buyer_addr1,
			    m_redirect_url : 'reservation_member.do'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        location.href = 'inPayPro.do'
			        		+'?payCode=${resvDto.payCode}'
			        	    +'&amount='+rsp.paid_amount
			                +'&pay_method='+pay_method1
			        		+'&buyer_name='+buyer_name1 
			        		+'&buyer_email='+buyer_email1
			        		+'&buyer_tel='+buyer_tel1
			        		+'&buyer_addr='+buyer_addr1
			        		+'&approvNum='+rsp.apply_num
			        		+'&discount='+discount;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		     return false;
		});
	});
	
	function usePoint() {
		var point = $("#mPoint").val();
		if(point > ${mbDto.mpoint}) {
			alert("가진 포인트를 초과했습니다!");
			return false;
		}
		$("#discount").val(point);
		$("#amount").val(${resvDto.amount }-point);
	}
</script>
<style type="text/css">
	caption {
		caption-side: top;
	}
	
	#servImg {
		width: 443px;
		height: 270px;
	}
	
	.form-control {
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
	.btn {
		padding-top: 0px;
		padding-bottom: 0px;
	}
	.card {
		min-width: 445px;
		max-width: 445px;
	}	
	.col-md-7 {
		min-width: 635px;
	}
</style>
</head>
<body>
<div class="container">
	<div style="margin-top: 30px; margin-bottom: 30px">
		<br>
	</div>
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
		<table class="table">
			<caption>예약 정보</caption>
			<tr>	
				<td>예약 인원</td>
				<td>${resvDto.reMemSize }명</td>
			</tr>
			<tr>	
				<td>투어예정일</td>
				<td>${resvDto.tourDate }</td>
			</tr>
		</table>
	
	</div>
<div class="col-md-7">

	<table class="table">
		<caption>
			<span>구매자 정보</span>
		</caption>
		<tr>
			<td >ID</td>
			<td>${resvDto.memberId }</td>
			<td>이름</td>
			<td><input type="text" class="form-control" id="buyer_name" name="buyer_name" value="${mbDto.mname }" required="required"></td>
		</tr>
		<tr>
			<td width="100px">연락처</td>
			<td><input type="tel"  class="form-control" id="buyer_tel" name="buyer_tel" value="${mbDto.tel }" required="required"></td>
			<td >이메일</td>
			<td><input type="text" class="form-control" id="buyer_email" name="buyer_email" value="${resvDto.memberId }" required="required"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan=3><input type="text" class="form-control" id="buyer_addr" name="buyer_addr"  value="${mbDto.addr }" required="required"></td>
		</tr>
		<tr>
			<td>포인트</td>
			<td>${mbDto.mpoint } P </td>
			<td width="100px"><input style="width: 100px" type="number" value="${mbDto.mpoint }" id="mPoint" name="mpoint" max="${mbDto.mpoint }"></td>
			<td><input type="button" class= "btn" value="포인트 사용" onclick="usePoint()"></td>		
		</tr>
	</table>
	<table class="table">
		<caption>
			<span>결제 정보</span>
		</caption>
		<tr>
			<td>결제 코드</td>
			<td>${resvDto.payCode }</td>
		</tr>
		<tr>	
			<td>가격</td>
			<td><fmt:formatNumber value = "${resvDto.amount }" type="currency" currencySymbol="￦"/></td>
		</tr>
		<tr>	
			<td>할인금액</td>
			<td><input type="number" class="form-control" value="0" name="usePoint" id="discount" readonly="readonly"></td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td><input type="text" class="form-control"  id="amount" value= "${resvDto.amount }" readonly="readonly"></td>
		</tr>
	</table>
	<hr>
	<table>
		<caption>
			<span>결제 방법</span>		
		</caption>
		<tr>
			<td style="padding-left:30px;"><input type="radio" name="pay_method" value="card"> 신용카드</td>
			<td style="padding-left:30px;"><input type="radio" name="pay_method" value="vbank"> 무통장입금</td>
			<td style="padding-left:30px;"><input type="radio" name="pay_method" value="trans"> 실시간계좌이체</td>
			<td style="padding-left:30px;"><input type="radio" name="pay_method" value="phone"> 핸드폰 소액결제</td>
		</tr>
	</table>
	<hr>
	<center>	
		<div>
				<input type="button" class="btn btn-info" id="pay" value="결제하기">
				<input type="button" class="btn btn-info" value="취소" onclick="location.href='reservation_member.do'">
		</div>
	</center>
	</div>
</div>
</div>
</body>
</html>