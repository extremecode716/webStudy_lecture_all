<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head><title>레코드 삽입(추가)예제</title>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script>
	$(document).ready(function(){
		$("form").submit(function(){
			if($("#id").val()==""){
				alert("ID를 입력 하세요");
				$("#id").focus();
				return false;
			}
			if($("#passwd").val()==""){
				alert("비밀번호를 입력 하세요");
				$("#passwd").focus();
				return false;
			}
			if($("#name").val()==""){
				alert("이름을 입력 하세요");
				$("#name").focus();
				return false;
			}
		});
		
	});
</script>
</head>

<body>
  <h2>member1 테이블에 레코드삽입(추가)예제</h2>

  <FORM METHOD="post" ACTION="insertTest.jsp">
    아이디 : <INPUT TYPE="text" NAME="id" id="id"><p>
    패스워드 : <INPUT TYPE="password" NAME="passwd" id="passwd"><p>
    이름:<INPUT TYPE="text" NAME="name" id="name"><p>
    <INPUT TYPE="submit" VALUE="보내기">
  </FORM>

</body>
</html>