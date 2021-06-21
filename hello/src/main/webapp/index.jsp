<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		var url = document.getElementById("url").value;
		location.href = url;
	}
</script>
</head>
<body>
	<h2>원하는 작업을 선택하세요</h2>
	<!-- <script type="text/javascript">
			location.href="hello";
		</script> -->
	<select id="url" onchange="chk()">
		<option value="hello">hello</option>
		<option value="color">배경색</option>
		<option value="gugu">구구단</option>
		<option value="joinForm">회원가입</option>
	</select>
</body>
</html>