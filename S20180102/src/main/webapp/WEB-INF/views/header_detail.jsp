<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	 href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
	integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
	crossorigin="anonymous">
<script type="text/javascript" src="js/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"
	integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4"
	crossorigin="anonymous"></script>
<style type="text/css">

/* 레이아웃 css */
body {
	margin: 0px;
}
pre{
    padding:10px;
    overflow: auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */
    font-family: sans-serif;
}  
.header {
	display: inline-block;
	width: 100%;
	height: 70px;
	background-color: white;
	border-bottom: 1px solid rgb(61, 183, 204);
}

li {
	list-style: none;
}

#logo {
	width: 150px;
	height: 30px;
}
#logoSet {
	width: 150px;
	margin: 20 auto;
}

ul, p {
	margin: 0;
}
</style>

<!-- 로그인 여부 체크 -->
<script type="text/javascript">
	$(function(){
		var id = "${ID}";
		if( id ==null || id == ""){
			alert("로그인이 필요합니다!")
			location.href=history.go(-1);
		} 
	});
</script>	

</head>
<body>
	<div class="header">
		<div id="logoSet">
			<img id="logo"
				src="${pageContext.request.contextPath}/items/logo2.JPG"
				alt="logo이미지" onclick='location.href="main.do"'>		
		</div>
	</div>
</body>
</html>