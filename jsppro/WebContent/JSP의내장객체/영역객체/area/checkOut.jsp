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
<H2>계산</H2>
선택한 상품 목록
<HR>
<%

	// session scope 에 저장된 productlist 라는 이름의 ArrayList 객체를 가져옴.
	ArrayList list = (ArrayList)session.getAttribute("productlist");

	// 선택한 상품이 하나도 없는 경우
	if(list == null) {
		out.println("선택한 상품이 없습니다.!!!");
	}
	else {

		// 선택한 상품이 있을 경우 리스트를 출력함.
		for(Object productname:list) {
			out.println(productname+"<BR>");
		}
	}
%>
</center>
</body>
</html>