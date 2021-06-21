<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경 처리결과</title>
<style type="text/css">
	td {
		padding: 10px;
	}
</style>

<script type="text/javascript">
	function chk() {

		if (frm.npw.value != frm.npw2.value) {
			alert("암호가 다릅니다");
			frm.npw.focus();
			return false;
		}
		return true;

	}
	
	function checkPassword(){
		var id = '${memberId}';
		var password = frm.npw.value;
		var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;
		
		if(!passwordRules.test(password)){
		alert('숫자/영문자/특수문자 조합으로 8~12자리를 사용해야 합니다.');
		return false;

		}

		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);

		if(checkNumber <0 || checkEnglish <0){
		alert("숫자와 영문자를 혼용하여야 합니다.");
		return false;

		}
		if(/(\w)\1\1\1/.test(password)){
		alert('444같은 문자를 4번 이상 사용하실 수 없습니다.');
		return false;

		}

		if(password.search(id) > -1){

		alert("비밀번호에 아이디가 포함되었습니다.");

		return false;

		}
		return true;

		}	
</script>

</head>
<body>
	<jsp:include page="memberBar.jsp"></jsp:include>
	<div class="container">
 		<form action="changePasswd.do" name="frm" onsubmit="return chk()" method="post">
			 <input type="hidden" value="${memberId}" name="memberId">
		<center>
			<div style="margin-top: 50px;  margin-bottom:50px">
				<h2>비밀번호 변경</h2>
				<br>
				<hr>
			</div>

			<table>

				<tr>
					<td>ID </td>
					<td>${memberId }</td>
				</tr>

				<tr>
					<td>현재 비밀번호 </td> 
					<td> 
						<input type="password" name="pw" class="form-control"
								placeholder="password" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 13px; color: red">
						*비밀번호는 8~12자 영문/숫자/특수문자를 혼합하여 사용하실수 있습니다.
					</td>
				</tr>
				<tr>

					<td>새 비밀번호 </td>
					<td>
						<input type="password" name="npw" class="form-control"
						placeholder=" new password " required="required" onchange="checkPassword()">
					</td>
				</tr>
				<tr>
					<td>변경 비밀번호 확인 </td>
					<td>
						<input type="password" name="npw2" class="form-control"
						placeholder=" confirm password " required="required" onchange="chk()">
						</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 13px;">
						ㆍ변경하실 비밀번호를 다시한번 입력해 주세요.
					</td>
				</tr>
			</table>
			<div  style="margin-top: 20px">
				<input type="submit" class="btn btn-info" value="비밀번호변경">
				<input type="reset" class="btn" value="다시">
			</div>
			</center>
		</form>
	</div>
</body>

</html>