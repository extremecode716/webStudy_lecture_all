<%@ page contentType="text/html; charset=euc-kr" %>

<html>
	<body>

	<h1>간단한 자바빈 프로그래밍</h1>
	<br>

	<form action="simpleBean.jsp" method="post" >
	<table width="500" border="0" cellspacing="0" cellpadding="3" align="left">
		<tr><td>이름</td>
			<td><input type=text name="name"></td>
		</tr>
		<tr> 
			<td width="100"> 메시지</td>
			<td width="400"> 
				<input type="text" name="msg" size="20" maxlength="30">
				<input type="submit" name="send" value="보내기">
			</td>
		</tr>
	</table>
	</form>

	</body>
</html>