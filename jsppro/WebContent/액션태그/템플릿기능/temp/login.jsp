<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
	<head><title>�α���</title>
	<script>
	function check(){
		if(document.myform.id.value == ""){
			alert("ID�� �Է� �ϼ���~!!");
			document.myform.id.focus();
			return false;
		}
		if(document.myform.pass.value == ""){
			alert("��й�ȣ�� �Է� �ϼ���~!!");
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
			<tr><td>��й�ȣ</td>
				<td><input type=text name=pass></td>
			</tr>
			<tr><td colspan=2 align=center>
					<input type=submit value="�α���">
					<input type=reset value="���">
				</td>
			</tr>
		</table>
	</form>
	</body>	
</html>