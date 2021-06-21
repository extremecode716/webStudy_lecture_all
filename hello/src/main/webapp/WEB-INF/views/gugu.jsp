<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>구구단 ${num }단</h2>
	<c:forEach var="i" begin="1" end="9">
		${num } * ${i } = ${num*i }<br>
	</c:forEach>
</body>
</html>