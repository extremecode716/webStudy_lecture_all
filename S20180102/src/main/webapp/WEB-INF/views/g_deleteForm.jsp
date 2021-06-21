<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경 처리결과</title>
<script type="text/javascript">
	function chk() {
	
		if(frm.pw.value != '${mbDto.pw}') {
			alert("비밀번호를 잘못입력하셨습니다.")
			frm.pw.focus();
			return false;
		}

		if (frm.pw.value != frm.pw2.value) {
			alert("암호가 다릅니다");
			frm.pw.focus();
			return false;
		}

		if($("input:checkbox[id='noticeAgree']").is(":checked") == false) {
			alert("안내 사항을 확인하여 주십시오.")
			return false;
		}
		
		return true;

	}
</script>

</head>
<body>
	<jsp:include page="guideBar.jsp"></jsp:include>

<div class="container">
		<form action="g_delete.do" name="frm" onsubmit="return chk()" method="post">	
			<center>
				<div style="margin-top: 50px; margin-bottom: 50px">
					<h2>가이드 탈퇴 안내</h2>
					<br>
					<hr>
				</div>
			</center>	
			<h5 style="color: red">가이드탈퇴를 신청하기 전에 안내 사항을 확인해주세요.</h5>
					<h4>√ 가이드 탈퇴할 경우 등록된 가이드 상품의 복구가 불가능 합니다.</h4>
					<h4>√ 기본 회원으로서 활동이 가능합니다.</h4>
				<center style="margin-top: 60px;">
				<input type="checkbox" id="noticeAgree" value="agree">
				안내 사항을 모두 확인하였으며, 이에 동의합니다.<br>
				<hr style="margin: 30px 0px 30px 0px">

				<div class="form-group col-sm-3">
								<label for="pw">Password</label> 
								<input
									type="password" name="pw" class="form-control"
									id="pw"  placeholder="password"
									required="required"> 
									
				</div>
				<div class="form-group col-sm-3" style="margin-bottom: 50px">
								<label for="pw2">Password Check</label> 
								<input
									type="password" name="pw2" class="form-control"
									id="pw2"  placeholder="confirm password"
									required="required"> 
				</div>	
				<input type="submit" class="btn" value="가이드 탈퇴">
				<input type="button" class="btn" value="취소" onclick="location.href='profile_guide.do'">
				</center>
		</form>
	</div>
</body>

</html>