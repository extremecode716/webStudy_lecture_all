<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugu</title>
</head>
<body>
[ ${dan} 단] <br><br>
<c:forEach var="i" begin="1" end="9">
${dan} * ${i} = ${dan * i} <br>
</c:forEach>
</body>
</html>