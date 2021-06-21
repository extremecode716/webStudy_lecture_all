<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mimg {
	width: 120px;
	height: 120px;
	border-radius: 60px;
}
</style>

<script type="text/javascript">
	function winop2() {
		left1 = (screen.width - 300) / 2;
		top1 = (screen.height - 600) / 2;
		window.open("jusoPopup.jsp", "pop", "left=" + left1 + ",top=" + top1
				+ ", width=570, height=420, scrollbars=no, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		$('#roadFullAddr').val(roadFullAddr);
	}
</script>
</head>
<body>
	<jsp:include page="memberBar.jsp"></jsp:include>

	<div class="container">
		<form action="user_update.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${memberDto.authority }" name="authority">
			<center>
				<div style="margin-top: 50px; margin-bottom: 50px">
					<h2>프로필 수정</h2>
					<br>
					<hr>
				</div>
				<table>
					<tr>
						<td><div class="custom-file">
							<input type="file" class="custom-file-input" name="memberImage" 
							       id="memberImage">
							<label class="custom-file-label" for="memberImage">Choose
							       profile Image</label>
						</div></td>
					</tr>
					<tr>
						<td rowspan="5">
						<center>
							<img alt="현재 사진" id="mimg"
								src="${pageContext.request.contextPath}/images/${memberDto.mimg }">
						</center>	
						</td>
						<td>
							<div class="form-group" style="margin-left:30px;">
								<label for="id">ID (Email address)</label> 
								<input
									type="email" name="memberId" class="form-control"
									id="id" value="${memberDto.memberId}"
									readonly="readonly"> 
									<small class="form-text text-muted">
										We'll never share your email with anyone else.
									</small>
							</div>
						</td>
						<td><div class="form-group" style="margin-left:30px;">
							<label for="mname">Name</label> 
							<input
								type="text" name="mname" class="form-control"
								id="mname" value="${memberDto.mname}"
								required="required"  readonly="readonly"> 
								<small class="form-text text-muted">
								We'll never share your name with anyone else.</small>
						</div></td>
					</tr>
					<tr>
						<td><div class="form-group" style="margin-left:30px;">
								<label for="nickname">Nickname</label> 
								<input
									type="text" name="nickName" class="form-control"
									id="nickname" value="${memberDto.nickName}"
									required="required"> 
								
						</div></td>
						<td><div class="form-group" style="margin-left:30px;">
							<label for="tel">Tel</label> 
							<input
								type="tel" name="tel" class="form-control"
								id="tel" value="${memberDto.tel}"
								required="required"> 
								
						</div></td>
					</tr>
					<tr>
						<td colspan=2><div class="form-group" style="margin-left:30px;">
							<label for="roadFullAddr">Address<a href="#" style="margin-left: 20px"><img
								src="https://pics.auction.co.kr/myauction/button/btn_post02.gif"
								alt="우편번호찾기" class="vm" onclick="winop2()"></a></label> 
							<input
								type="text" name="addr" class="form-control"
								id="roadFullAddr" value="${memberDto.addr}"
								required="required"> 
						</div></td>
					</tr>

				</table>
				<input type="submit" class="btn btn-info" style="margin-top: 100px" value="회원정보수정">
			</center>
		</form>
	</div>
</body>
</html>