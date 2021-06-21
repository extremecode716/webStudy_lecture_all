<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header_detail.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ResvConfirmchk() {
		if(frm.confirm!=null){
		var r = confirm("확정한 이후에는 취소가 불가능합니다. 정말 확정하시겠습니까?");
		if (r == true) {
		    return true;
		} else {
		    return false;
		}
		}else{
			alert("확정여부를 선택하세요");
			return false;
		}
	}

</script>
</head>
<body>
<div style="padding: 40px 20px">
	<form action="confirmResPro.do" name="frm" onsubmit="return ResvConfirmchk()">
		<h2>[${revDto.get(0).tourDate }]</h2>
		<h4><b>예약 확정/취소</b></h4> 
		<br>
		<span style="color:gray"><b>총 인원</b></span>     ${totalMember }명 <br>
		<span style="color:gray"><b>총 예약</b></span>     ${revDto.size() }건
		<hr>
		<table class="table">
			<tr>
				<th>예약자 ID</th>
				<th>예약일</th>
				<th>예약인원</th>
				<th>결제여부</th>
				<th>확정여부</th>
			</tr>
			<c:forEach var="revDto" items="${revDto }">
			<tr>
				<td>${revDto.memberId }</td>
				<td>${revDto.reservDate }</td>
				<td>${revDto.reMemSize }</td>
				<c:if test="${revDto.pay_yn == 'y' || revDto.pay_yn == 'Y' }">
					<td style="color: red">결제</td>
				</c:if>
				<c:if test="${revDto.pay_yn == 'n' || revDto.pay_yn == 'N' }">
					<td style="color: blue">미결제</td>
				</c:if>
				<c:if test="${revDto.confirm == 'y' || revDto.confirm == 'Y' }">
					<td style="color: red">확정</td>
				</c:if>
				<c:if test="${revDto.confirm == 'n' || revDto.confirm == 'N' }">
					<td style="color: blue">미확정</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<hr>
		<span style="font-size: 14px"> Y를 누를경우 전체 예약 확정 / N을 선택할 경우 전체 예약 취소<br>
		예약을 취소하시면 회원에게 예약취소 메시지가 자동 송부됩니다.<br></span>
		<span style="color:red; font-size: 12px">(단, 이미 확정된 예약은 취소가 불가능합니다.)</span><br>
		※ 결정 후 변경하실 수 없으니 신중하게 하시기 바랍니다.<br>
		<input type="hidden" name="gservNo" value="${revDto.get(0).gservNo}"> 
		<input type="hidden" name="tourDate" value="${revDto.get(0).tourDate}"> 
		<center>
		<hr>
		Y <input type="radio" style="margin-right: 20px" name="confirm" value="Y">
		N <input type="radio" name="confirm" value="N">
		<hr>
		</center>
		<br><input type="submit" value="결정" class="btn btn-info" style="width: 100%">
	</form>
</div>
</body>
</html>