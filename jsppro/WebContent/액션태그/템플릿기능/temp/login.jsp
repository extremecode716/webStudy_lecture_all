<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
	<head><title>로그인</title>
	<script>
	function check(){
		if(document.myform.id.value == ""){
			alert("ID를 입력 하세요~!!");
			document.myform.id.focus();
			return false;
		}
		if(document.myform.pass.value == ""){
			alert("비밀번호를 입력 하세요~!!");
			document.myform.pass.focus();
			return false;
		}		
	}	
	</script>
	</head>
	<body>
	<form onSubmit="return check()" name=myform 
			action=send.jsp method=post>
		<table border=1 width=300 align=center>
			<tr><td>ID</td>
				<td><input type=text name=id></td>
			</tr>
			<tr><td>비밀번호</td>
				<td><input type=text name=pass></td>
			</tr>
			<tr><td colspan=2 align=center>
					<input type=submit value="로그인">
					<input type=reset value="취소">
				</td>
			</tr>
		</table>
	</form>
	</body>	
</html>