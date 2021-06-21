<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#gbank').val('${gDto.gbank}').prop("selected", true);
	});
</script>
</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<div class="container">
	<div style="margin-top: 50px; margin-bottom: 50px; text-align: center">
					<h2>정산</h2>
					<br>
					<hr>
	</div>
	<form action="pay_guidePro.do">
	<table style="width: 60%; margin: auto;">
	<tr>
		<td>정산 가능 금액</td>
		<td>
		<fmt:formatNumber value = "${gDto.totalCost/100 * 70  }" type="currency" currencySymbol="￦"/>
		</td>
	</tr>
	<tr>
		<td>정산할 금액</td>
		<td><input type="number" class="form-control" required="required"
				   name="cost" min="1000" max="${gDto.totalCost }"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" class="form-control" required="required" value="${gDto.gtel }"></td>
	</tr>
	<tr>
		<td>은행</td>
		<td><select name="gbank" class="form-control" required="required" id="gbank">
				<option value="" selected="selected">은행선택</option>
				<option value="국민">국민은행</option>
				<option value="신한">신한은행</option>
				<option value="새마을금고">새마을금고</option>
				<option value="하나">하나은행</option>
				<option value="농협">농협은행</option>
				<option value="우체국">우체국은행</option>
				<option value="KDB">KDB기업은행</option>
				<option value="우리">우리은행</option>
				<option value="신협">신협은행</option>
				<option value="카카오">카카오뱅크</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>계좌번호</td>
		<td><input type="text" class="form-control" required="required" value="${gDto.gaccount }"></td>
	</tr>
	<tr>
		<td colspan="2" style="padding-top: 30px"> 
			<input type="submit" value="정산" class="btn btn-info" style="width: 100%">
		</td>
	</tr>
	</table>
	
	</form>
</div>
</body>
</html>