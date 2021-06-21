<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div style="margin-top: 50px; margin-bottom: 30px">
		<h2>결제가 완료되었습니다.</h2>
	</div>
	<hr>
	<table class="table">
	<caption style="caption-side: top">결제 정보</caption>
		<tr>
			<td>결제자 EMAIL(ID)</td>
			<td>${pDto.memberId }</td>
		</tr>
		<tr>
			<td>결제 코드</td>
			<td>${pDto.payCode }</td>
		</tr>
		<c:if test="${approvNum !=null }">
			<tr>		
				<td>카드 승인 코드</td>
				<td>${approvNum }</td>
			</tr>
		</c:if>
		<tr>
			<td>결제 금액</td>
			<td><fmt:formatNumber value = "${pDto.amount }" type="currency" currencySymbol="￦"/></td>
		</tr>
		<tr>
			<td>결제 방법</td>
			<td>${pDto.pay_method }</td>
		</tr>
	</table>
	<div style="margin: auto; width: 500px; text-align: center; margin-top: 40px">
			<input type="button" class="btn btn-info" value="결제내역" onclick="location.href='pay_member.do'">
			<input type="button" class="btn btn-info" value="HOME" onclick="location.href='main.do'">
	</div>
</div>
</body>
</html>