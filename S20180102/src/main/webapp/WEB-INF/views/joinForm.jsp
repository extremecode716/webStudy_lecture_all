<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Join : "Follow Me"</title>
<%
	String context = request.getContextPath();
%>
<style type="text/css">
	label {
		text-align: left;
	}
	.span1, .span2{
		padding-left: 10px;
	}
</style>
<script type="text/javascript">
	function chk() {
		var memberId1=document.getElementById("memberId").value;
		$.ajax({
			data: {memberId:memberId1},
			url : "<%=context%>/fs.do",
					success : function(data) {
						if (data == '1') {
							$(".span1").text("이미 사용중인 이메일입니다.").css("color",
									"#ff0000");
							id = memberId1;

						} else if (data == '0') {
							$(".span1").text("사용가능한 이메일입니다.").css("color",
									"#ff0000");
						}
					}
				})
	}
	
	function chk2() {
		var pw = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;
		
		if(pw != pw2){
			$(".span2").text("패스워드가 같지 않습니다").css("color",
			"#ff0000");
		}
		
	}
	
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
<div class="container">
	<form action="joinMember.do" method="post" enctype="multipart/form-data">
		<center>		
			<h3 style="margin-top: 30px">회원가입</h3>
		</center>
	<div style="width: 40%; margin: auto"> 
			<hr>
		<div class="form-group">
		   <label for="email">이메일(ID)*</label>
		   	<input type="email" class="form-control" name="memberId" id="memberId" onblur="chk()" required="required" placeholder="Email">
			<span class="span1"></span>
		 </div>
		<div class="form-group">
		   <label for="nickName">닉네임*</label>
		   	<input type="text" class="form-control" name="nickName" id="nickName" placeholder="Nickname" required="required">
		 </div>
		 <div class="form-group">
		   <label for="password">패스워드*</label>
		   <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
		 </div>
		 <div class="form-group">
		   <label for="pwChk">패스워드 확인*</label>
		   <input type="password" class="form-control" id="pw2" name="pw2" onblur="chk2()" placeholder="Password Check">
		   <span class="span2"></span>
		 </div>
		<div class="form-group">
		   <label for="tel">연락처*</label>
		   	<input type="tel" class="form-control" name="tel" id="tel" required="required" placeholder="PhoneNumber">
		 </div>	
		<div class="form-group">
		   <label for="mname">이름*</label>
		   	<input type="text" class="form-control" name="mname" id="mname" required="required" placeholder="Name">
		 </div>	
		<div class="form-group">
		   <label for="Address">주소<a href="#" style="margin-left: 20px"><img
								src="https://pics.auction.co.kr/myauction/button/btn_post02.gif"
								alt="우편번호찾기" class="vm" onclick="winop2()"></a></label>
		   	<input type="text" class="form-control" name="addr" id="roadFullAddr" placeholder="Address">
		 </div>	
		<div class="form-group">
		  	 프로필 사진
		   <div class="custom-file">
				<input type="file" class="custom-file-input" name="memberImage" 
					   id="memberImage">
				<label class="custom-file-label" for="memberImage">Choose profile Image</label>
		 	</div>	
		  <button type="submit" class="btn btn-info"
		  		  style="width:100%; margin-top: 50px">회원등록</button>
	 	</div>
	 </div>

	</form>
</div>
</body>
</html>