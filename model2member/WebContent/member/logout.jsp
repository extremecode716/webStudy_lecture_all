<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // 세션 삭제
	session.invalidate();
%>  

<script>
	alert("로그아웃");
	location.href="./LoginForm.do";
</script>  