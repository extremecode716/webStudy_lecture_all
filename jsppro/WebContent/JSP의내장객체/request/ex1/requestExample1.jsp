<%@ page contentType="text/html;charset=utf-8"%>

<%	// 폼파일에서 한글값이 post방식으로 전송될때 utf-8로 인코딩을 시켜주는 역할
	request.setCharacterEncoding("utf-8");
%>

<html>
<h1>Request 객체1</h1>

<%
	String name = request.getParameter("name");
	String studentNum = request.getParameter("studentNum");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	
/* 
	if(gender.equals("m")){
		gender = "남자";
	}else{
		gender = "여자";
	} */
%>

<body>
성명: <%=name%><p>
학번: <%=studentNum%><p>
성별 : <%=gender%><p>
전공 : <%=major%>
</body>
</html>

