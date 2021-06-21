<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	
	function chk(){
		if($("#qaType").val() == ""){
			alert("문의유형을 선택해주세요.");
			return false;
		}
		var qaType = $("#qaType").val();
		var qaTitle = $("input[name=qaTitle]").val();
		$("input[name=qaTitle]").val("[" + qaType +"]" + qaTitle);			
		if($("input[name=qaTitle]").val() == "" || $("input[name=qaTitle]").val() == null){
			alert("제목을 입력해주세요.");
			return false;
		}
		if($("#contents").val() == "" || $("#contents").val() == null){
			alert("문의사항을 입력해주세요");
			return false;
		} 
	}
</script>

<body>
<div class="container">
	<center>
		<h2 style="margin: 30px">Question</h2>
		<hr style="margin: 30px">
		<form action="inQAPro.do">
		<input type="hidden" name="qaReceiver" value="${qaDto.qaReceiver }">
			<table style="width: 60%">
				<tr>
					<th>서비스No</th>
					<td><input type="text" name="gservNo" class="form-control" readonly="readonly"  value="${qaDto.gservNo }"></td>
				</tr>
				<tr>
					<th>문의자</th>
					<td><input name="memberId" value="${ID}" readonly="readonly" size="48.5"
						       class="form-control" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
					<select id="qaType">
						<option value="" selected="selected">유형선택</option>
						<option value="예약">예약관련</option>
						<option value="결제">결제관련</option>
						<option value="상품">상품관련</option>
						<option value="기타">기타</option>
					</select>
						<input name="qaTitle"  size="48.5" class="form-control" required="required"/></td>
						
				</tr>
				<tr>
					<th>문의내용</th>
					<td><textarea name="qaContent" id="contents" rows="8" cols="50" required="required"  class="form-control"></textarea></td>
							
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="문의하기" onclick="return chk()" class="btn btn-info btn-block" style="height: 40px; margin-top: 20px;" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</div>
</body>
</html>