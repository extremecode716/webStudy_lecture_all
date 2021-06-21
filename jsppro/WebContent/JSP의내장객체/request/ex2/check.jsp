<%@ page contentType="text/html;charset=utf-8"%>

<html>
<body>

	<%
		request.setCharacterEncoding("utf-8");

		String[] choice = request.getParameterValues("site");
		String result = "";

		for (int i = 0; i < choice.length; i++) {
			result = result + choice[i] + " ";
		}
	%>

	<center>
		귀하는 <font color=blue><%=result%></font> 를 좋아하시는군요.
	</center>

</body>
</html>