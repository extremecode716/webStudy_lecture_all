<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#gImg {
		width: 120px;
		height: 120px;
		border-radius: 60px;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('#gbank').val('${gDto.gbank}').prop("selected", true);
	});
</script>

</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>

	<div class="container">
		<form action="upGuidePro.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="${gDto.memberId }">
			<center>
				<div style="margin-top: 50px; margin-bottom: 50px">
					<h2>가이드 프로필 수정</h2>
					<br>
					<hr>
				</div>
				<table>
					<tr>
						<td><div class="custom-file">
							<input type="file" class="custom-file-input" name="guideImg" 
							       id="memberImage">
							<label class="custom-file-label" for="guideImg">Choose
							       Guide Image</label>
						</div></td>
					</tr>
					<tr>
						<td rowspan="5">
						<center>
							<img alt="현재 사진" id="gimg"
								src="${pageContext.request.contextPath}/images/${gDto.gimg }">
						</center>	
						</td>
					</tr>
					<tr>
						<td><div class="form-group" style="margin-left:30px;">
							<label for="tel">Tel</label> 
							<input
								type="tel" name="gtel" class="form-control"
								id="tel" value="${gDto.gtel }"
								required="required"> 
								
						</div></td>
						<td><div class="form-group" style="margin-left:30px;">
							<label for="gpage">개인 홈페이지</label> 
							<input
								type="text" name="gpage" class="form-control"
								id="gpage" value="${gDto.gpage }"
								required="required"> 
							</div></td>	
					</tr>
					<tr>
							<td><div class="form-group" style="margin-left:30px;">
							<label for="gbank">거래 은행</label> 
							<select name="gbank" id="gbank">
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
							<input
								type="text" name="gaccount" class="form-control"
								id="gaccount" value="${gDto.gaccount }"
								required="required"> 
							</div></td>	
							<td><div class="form-group" style="margin-left:30px;">
							<label for="kakaoId">KakaoId</label> 
							<input
								type="text" name="kakaoId" class="form-control"
								id="kakaoId" value="${gDto.kakaoId }"
								required="required"> 
							</div></td>	
					</tr>
				</table>
				<hr>
				<h4>가이드 소개</h4>
				<textarea style="border-radius: 0.5em; margin-top: 20px" rows="10" cols="120" name="ginfo">${gDto.ginfo }</textarea><br>
				<input style="margin-top: 20px" type="submit" value="가이드정보수정" class="btn btn-info"> 		
				<input style="margin-top: 20px" type="button" value="취소"  class="btn" onclick="location.href='profile_guide.do?gno=${gDto.gno}'">
			</center>
			</form>
		</div>
	

<%--  <%@ include file="footer.jsp"%> --%>
</section>
</body>
</html>