<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body {
	padding-top: 70px;
	padding-left: 250px;
}

#mimg {
	width: 120px;
	height: 120px;
	border-radius: 60px;
}
</style>
</head>
<body>
	<jsp:include page="memberBar.jsp"></jsp:include>
	<div class="container">
		<center>
			<div style="margin-top: 50px; margin-bottom: 15px">
				<h2>PROFILE</h2>
				<br>
			</div>
		</center>
		<center>
			<div class="table-responsive-lg">
				<table class="table">
					<tr>
						<td colspan="3" style="text-align: right; padding-top: 50px">
							<a href="updateForm.do?memberId=${memberDto.memberId}">프로필수정</a>
							<a href="delMemberForm.do" style="margin-left: 20px">회원탈퇴</a>
						</td>
					<tr>
						<td rowspan="7" width="300px">
							<center>
								<img onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'" id="mimg" src="${pageContext.request.contextPath}/images/${memberDto.mimg }">
							</center>
						</td>
						<td style="text-align: center; width: 100px;">아이디</td>
						<td>${memberDto.memberId}</td>
					</tr>
					<tr>
						<td style="text-align: center;">비밀번호</td>
						<td>
							<input type="button" class="btn" value="비밀번호변경" onclick="location.href='changePwForm.do?memberId=${memberDto.memberId}'">
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">닉네임</td>
						<td>${memberDto.nickName}</td>
					</tr>
					<tr>
						<td style="text-align: center;">전화번호</td>
						<td>${memberDto.tel}</td>
					</tr>
					<tr>
						<td style="text-align: center;">주소</td>
						<td>${memberDto.addr}</td>
					</tr>
					<tr>
						<td style="text-align: center;">이름</td>
						<td>${memberDto.mname}</td>
					</tr>
					<tr>
						<td style="text-align: center;">포인트</td>
						<td>${memberDto.mpoint }</td>
					</tr>
					<tr>
						<td colspan="3">
							<a href="main.do">HOME</a>
						</td>
					</tr>

				</table>
			</div>
		</center>

	</div>
</body>
</html>