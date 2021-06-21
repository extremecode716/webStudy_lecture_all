<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h2>포워딩될 페이지에 파라미터값 전달하기 예제</h2>

	<form method="post" action="forwardFrom3.jsp">
	이름 입력 : <input type="text" name="name"><br><br>
	색 선택: <br>
	<input type="radio" name="color" value="yellow">노랑색<br>
	<input type="radio" name="color" value="green">초록색<br>
	<input type="radio" name="color" value="blue">파랑색<br>
	<input type="radio" name="color" value="red">빨강색<p>
	<input type="submit" value="확인">
	</form>

	</body>
</html>