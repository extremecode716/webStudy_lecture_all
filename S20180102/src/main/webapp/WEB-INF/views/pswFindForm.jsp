<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<script type="text/javascript">

	var id=null;
	
	function Idchk() {
		var memberId1=document.getElementById("ID").value;
		
		$.ajax({
			
			data: {memberId:memberId1},
			url : "<%=context%>/fs.do",
			success : function(data) {
				if (data == '1') {
					$(".idArea1").text("저장하신 이메일이 맞습니다. 임시비밀번호를 보낼주소입니다. ").css(
							"color", "blue");
					id = memberId1;

				} else if (data == '0') {
					$(".idArea1").text("아이디를 찾을수 없습니다.").css("color", "#ff0000");
				}

			}

		})

	}
</script>
<style>
.idArea1 {
	font-size: 14px;
}

div#warp {
	width: 50%;
}

div#warp2 {
	width: 60%;
	height: 500px;
	padding: 30px 30px;
	margin: 50px auto;
	box-shadow: 5px 5px 15px gray;
}
</style>
<body>

	<div id="warp" class="container">
		<div id="warp2">
			<center>
				<img id="logo"
					 src="${pageContext.request.contextPath}/items/logo2.JPG"
					 alt="logo이미지" onclick='location.href="main.do"'>
			</center>
			<hr style="color: gray; border-style: dotted;">
			

			<h4>비밀번호를 잊어버리셨나요?</h4>
			<p class="pwtext">
				아이디(이메일)를 입력하세요. 임시 비밀번호가 발송됩니다. 
			</p>
			<br>
			<form action="mailTransport.do" name="frm">
				<table style="width: 100%">
					<tr>
						<td><input type="email" class="form-control" name="ID" placeholder="e-mail"
							       required="required" id="ID" oninput="Idchk()"></td>
					</tr>
					<tr>
						<td><span class="idArea1"></span></td>
					</tr>
	               <tr><td colspan="3" style="padding-top: 15px">
	               			<input type="submit" class="btn btn-info"
	               				   style="width: 100%; padding: 5px 20px; 
	               				   height: 40px" value="임시 비밀번호 받기">
	                   </td>
	               </tr>			
				</table>
			</form>
			
			<hr style="margin-top: 50px; margin-bottom: 50px">
			<h6 style="font-size: 12px; color: red; margin-bottom: 5px">
			* 아이디가 없으신가요? Follow Me의 회원이 되어보세요!</h6>
			<div style="width: 100%; border: 1px solid rgb(61,183,204);
						margin-top: 10px; text-align: center; padding: 10px 20px ">
				
				<a href="joinForm.do" style="color: rgb(61,183,204); padding: 10px 20px;">
				Sign Up</a>
				
			</div>

		</div>
	</div>



</body>
</html>