<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	

	// HTML 폼에서 입력된 한글 처리를 위한 부분
	request.setCharacterEncoding("euc-kr");

	// product 속성으로 전달된 파라미터를 읽어옴.
	String productname = request.getParameter("product");

	// session scope 에 저장된 productlist 라는 이름의 ArrayList 객체를 가지고 옴.
	ArrayList list = (ArrayList)session.getAttribute("productlist");

	// 만일 null 인 경우 처음 데이터를 추가한 것이므로 새로운 ArrayList 생성
	if(list == null) {
		list = new ArrayList();
	}

	// ArrayList 에 새로운 데이터 추가
	list.add(productname);
	session.setAttribute("productlist",list);
%>

	<!-- 자바스크립트를 이용해 간단한 메시지 출력  -->
	<script>
		alert("<%=productname %> 이(가)추가 되었습니다.!!");
		history.go(-1);
	</script>
</body>
</html>