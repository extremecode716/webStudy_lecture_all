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
		width: 80px;
		height: 80px;
		border-radius: 40px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function check() {
		$("#btnUpdate").click(function check() {
			//수정확인버튼
			document.form.action="";
		})
	})
</script>


</head>
<body>
<jsp:include page="guideBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom: 15px">
		<h2>INFORMATION</h2>
		<br>
	</div>
</center>
<center>
<div class="table-responsive-lg">
	<table class="table" style="width: 50%">
	<caption style="caption-side: top">가이드 정보</caption>
			<tr>
				<td rowspan="5">
				<img alt="프로필 사진" id="gImg" 
					 src="${pageContext.request.contextPath}/images/${gDto.gimg }"
					 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'">
				
				</td>
				
				<td>닉네임</td><td>${mbDto.nickName}</td>
			</tr>
			<tr>
				<td>전화번호</td><td>${gDto.gtel}</td>
			</tr>
			<tr>
				<td>카카오 계정 ID</td><td>${gDto.kakaoId}</td>
			</tr>
			<tr>
				<td>거래 은행</td><td>[${gDto.gbank }] ${gDto.gaccount}</td>
			</tr>
			<tr>
				<td>가이드 등급</td><td>${gDto.ggrade }</td>
			</tr>	
	</table>
</div>
		<br>
		<h2>소개글</h2>
		<hr style="margin: 40px 0px 40px 0px">
		<div style="width: 70%">
			<pre>${gDto.ginfo }</pre>
		</div>
		<div style="margin-top : 30px;">
			<input type="button" class="btn" onclick="location.href='author_detail.do?gno=${gDto.gno}'" value="myPage">
			<input type="button" class="btn" onclick="location.href='upGuideForm.do'" value="프로필 수정">
			<input type="button" class="btn" onclick="location.href='delGuideForm.do'" value="가이드 탈퇴">	
		</div>

<div style="height: 150px">
</div>
</center>
</div>
</body>
</html>