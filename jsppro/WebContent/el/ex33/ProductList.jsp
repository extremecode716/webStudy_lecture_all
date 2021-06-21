<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ch10:EL 예제</title>
</head>
<body>
<center>
<H2>ch10:EL 예제-상품목록</H2>
<HR>
<form name=form1 method=POST action=ProductSel.jsp>
	<jsp:useBean id="product" class="jspbook.ch10.Product" scope="session"/>
	<%-- <%
		session.setAttribute("product", product); // 위 액션태그의 scope="session"와 이 문장과 의미와 같다.
	%> --%>
	<select name="sel">
	<%
		// session 에서 가져온 Product 객체로 부터 저장되어 있는  목록을 가져와 출력함.
		for(String item : product.getProductList()) {
			out.println("<option>"+item+"</option>");
		}
	%>
	</select>
	<input type="submit" value="선택"/>
</form>
</center>
</body>
</html>