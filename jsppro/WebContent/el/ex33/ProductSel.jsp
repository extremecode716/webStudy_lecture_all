<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="jspbook.ch10.Product"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ch10:EL ����</title>
</head>
<body>
	<center>
		<H2>ch10:EL ����-��ǰ����</H2>
		<HR>
		<!-- ǥ�����(Expression Language) -->
		1. ������ ��ǰ�� : ${param.sel} <BR>
		<!-- ǥ���� �±� -->
		1. ������ ��ǰ�� :
		<%=request.getParameter("sel")%>
		<BR>
		<!-- ProductList.jsp���� session �������� ���� -->
		<!-- num1,num2�� private������ num1�� ����. �޼ҵ带 �����ʴ´�. 
ǥ��� num1������, getNum1()�� ȣ���ؼ� ����� ������ �޾ƶ�� �ǹ��̴�.�װ� num1 -->
		2. num1 + num2 = ${product.num1+product.num2} <BR>


		<!-- �� ������ Ǯ� ���� ���� �����̴�. -->
		<%
		Product pro = (Product) session.getAttribute("product"); // ǥ�����±״� �ٿ� ĳ������ �ؾ��Ѵ�. // EL�� ���ص��ȴ�.
		%>
		
		2. num1 + num2 = <%=pro.getNum1() + pro.getNum2() %>
	</center>
</body>
</html>