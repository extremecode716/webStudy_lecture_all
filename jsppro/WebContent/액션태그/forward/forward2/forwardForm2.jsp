<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<head>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
	
	$(document).ready(function(){
		
		$(":submit").click(function(){
			
			if($("#name").val() == ""){
				alert("�̸��� �Է� �ϼ���");
				$("#name").focus();
				return false;
			}
			
			if($("#a").is(":checked") == false &&
			   $("#b").is(":checked") == false &&	
			   $("#o").is(":checked") == false &&
			   $("#ab").is(":checked") == false){
				alert("�������� ���� �ϼ���");
				return false;
			}		
			
		});
		
	});	
	
	</script>
	</head>
	<body>

	<h1>�������� �������� �Ķ���Ͱ� �����ϱ� ����</h1>

	<form method=post action="forwardFrom2.jsp">
	�̸� : <input type=text id="name" name="name"> <br><br>
	
	����� ��������?<p> 
	
	<input type="radio" id="a" name="bloodType" value="a">A��<br>
	<input type="radio" id="b" name="bloodType" value="b">B��<br>
	<input type="radio" id="o" name="bloodType" value="o">O��<br>
	<input type="radio" id="ab" name="bloodType" value="ab">AB��<p>
	<input type="submit" value="������">
	</form>

	</body>
</html>
