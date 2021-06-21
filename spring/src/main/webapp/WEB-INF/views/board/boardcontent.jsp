<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>

<table border=1 width=400 align=center>
	<caption>상세 페이지</caption>
	<tr>
		<td>작성자</td>
		<td>${board.writer}</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>
			<fmt:formatDate value="${board.register}"
				pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${board.readcount}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${board.subject}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<%-- <pre>${board.content}</pre> --%>
			${content}
		</td>
	</tr>
	<tr><td colspan=2 align=center>
	
			<input type="button" value="목록" 
onClick="location.href='boardlist.do' ">
			
			<input type="button" value="수정" 
onClick="location.href='boardupdateform.do?no=${board.no}' ">
			
			<input type="button" value="삭제"
onClick="location.href='boarddeleteform.do?no=${board.no}' ">
			
		</td>
	</tr>
</table>

</body>
</html>