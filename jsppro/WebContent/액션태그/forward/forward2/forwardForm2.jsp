<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<head>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
	
	$(document).ready(function(){
		
		$(":submit").click(function(){
			
			if($("#name").val() == ""){
				alert("이름을 입력 하세요");
				$("#name").focus();
				return false;
			}
			
			if($("#a").is(":checked") == false &&
			   $("#b").is(":checked") == false &&	
			   $("#o").is(":checked") == false &&
			   $("#ab").is(":checked") == false){
				alert("혈액형을 선택 하세요");
				return false;
			}		
			
		});
		
	});	
	
	</script>
	</head>
	<body>

	<h1>포워딩될 페이지에 파라미터값 전달하기 예제</h1>

	<form method=post action="forwardFrom2.jsp">
	이름 : <input type=text id="name" name="name"> <br><br>
	
	당신의 혈액형은?<p> 
	
	<input type="radio" id="a" name="bloodType" value="a">A형<br>
	<input type="radio" id="b" name="bloodType" value="b">B형<br>
	<input type="radio" id="o" name="bloodType" value="o">O형<br>
	<input type="radio" id="ab" name="bloodType" value="ab">AB형<p>
	<input type="submit" value="보내기">
	</form>

	</body>
</html>
