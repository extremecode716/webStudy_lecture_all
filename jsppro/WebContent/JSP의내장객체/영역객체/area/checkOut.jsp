<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<H2>���</H2>
������ ��ǰ ���
<HR>
<%

	// session scope �� ����� productlist ��� �̸��� ArrayList ��ü�� ������.
	ArrayList list = (ArrayList)session.getAttribute("productlist");

	// ������ ��ǰ�� �ϳ��� ���� ���
	if(list == null) {
		out.println("������ ��ǰ�� �����ϴ�.!!!");
	}
	else {

		// ������ ��ǰ�� ���� ��� ����Ʈ�� �����.
		for(Object productname:list) {
			out.println(productname+"<BR>");
		}
	}
%>
</center>
</body>
</html>