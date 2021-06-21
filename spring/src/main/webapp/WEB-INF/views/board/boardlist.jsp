<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>

<a href="boardform.do">글작성</a>
<table border=1 width=600 align=center>
	<caption>글목록</caption>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>

	<c:forEach var="b" items="${list}">	
	<tr>
		<td>${b.no}</td>
		<td>
			<a href="boardcontent.do?no=${b.no}">
				${b.subject}
			</a>
		</td>
		<td>${b.writer}</td>
		<td>
			<fmt:formatDate value="${b.register}"
			pattern="yyyy-MM-dd HH:mm:ss"/>
		
		</td>
		<td>${b.readcount}</td>
	</tr>	
	</c:forEach>

</table>

</body>
</html>