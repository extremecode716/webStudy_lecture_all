<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>

	<h2>�������ϴ� ������: forwardTagFrom2.jsp</h2>

<%
   request.setCharacterEncoding("euc-kr");

   String name = request.getParameter("name");
   String selectedColor = request.getParameter("color");
%>

<jsp:forward page="<%=selectedColor+\".jsp\"%>">
    <jsp:param name="selectedColor" value="<%=selectedColor%>"/>
	<jsp:param name="name" value="<%=name%>"/>
</jsp:forward>