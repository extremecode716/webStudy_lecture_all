<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h1>�������ϴ� ������: forwardFrom2.jsp</h1>

	<%
		request.setCharacterEncoding("euc-kr");

//		String name1 = "��ȭ��";
		String bloodType = request.getParameter("bloodType") + ".jsp";
	
//		String bloodType = "a.jsp";
	%>

	<jsp:forward page="<%=bloodType%>"/>
	