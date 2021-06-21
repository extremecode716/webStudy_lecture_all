<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result==1}">
	<%
		String ID =(String)request.getAttribute("ID");
		session.setAttribute("ID", ID);
		String gno = (String)request.getAttribute("gno");
		session.setAttribute("gno", gno);
	%>
	<script type="text/javascript">
			location.href= "main.do";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("아이디가 없거나, 비밀번호가 틀립니다.")
		location.href= history.go(-1);
	</script>
</c:if>

</body>
</html>