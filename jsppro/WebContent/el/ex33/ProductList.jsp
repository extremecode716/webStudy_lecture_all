<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ch10:EL ����</title>
</head>
<body>
<center>
<H2>ch10:EL ����-��ǰ���</H2>
<HR>
<form name=form1 method=POST action=ProductSel.jsp>
	<jsp:useBean id="product" class="jspbook.ch10.Product" scope="session"/>
	<%-- <%
		session.setAttribute("product", product); // �� �׼��±��� scope="session"�� �� ����� �ǹ̿� ����.
	%> --%>
	<select name="sel">
	<%
		// session ���� ������ Product ��ü�� ���� ����Ǿ� �ִ�  ����� ������ �����.
		for(String item : product.getProductList()) {
			out.println("<option>"+item+"</option>");
		}
	%>
	</select>
	<input type="submit" value="����"/>
</form>
</center>
</body>
</html>