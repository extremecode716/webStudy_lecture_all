<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="jspbook.ch10.Product"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ch10:EL 예제</title>
</head>
<body>
	<center>
		<H2>ch10:EL 예제-상품선택</H2>
		<HR>
		<!-- 표현언어(Expression Language) -->
		1. 선택한 상품은 : ${param.sel} <BR>
		<!-- 표현식 태그 -->
		1. 선택한 상품은 :
		<%=request.getParameter("sel")%>
		<BR>
		<!-- ProductList.jsp에서 session 영역으로 설정 -->
		<!-- num1,num2는 private이지만 num1을 쓴다. 메소드를 쓰지않는다. 
표기는 num1이지만, getNum1()을 호출해서 결과를 리턴을 받아라는 의미이다.그게 num1 -->
		2. num1 + num2 = ${product.num1+product.num2} <BR>


		<!-- 위 내용을 풀어서 쓴게 밑의 내용이다. -->
		<%
		Product pro = (Product) session.getAttribute("product"); // 표현식태그는 다운 캐스팅을 해야한다. // EL은 안해도된다.
		%>
		
		2. num1 + num2 = <%=pro.getNum1() + pro.getNum2() %>
	</center>
</body>
</html>