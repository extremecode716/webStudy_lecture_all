<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   

<a href="./BoardForm.do">글쓰기</a> <br>
데이터 갯수 : ${listcount} 개

<table border=1 width=700 align=center>
	<caption>게시판 목록</caption>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
		
	<c:set var="num" value="${listcount - (page-1) * 10 }"/>	
	<c:forEach var="b" items="${boardlist}">
	<tr>
		<td>
			${num}
			<c:set var="num" value="${num-1}"/>
		</td>	
		<td>
		<c:if test="${b.board_re_lev > 0}">
			<c:forEach var="i" begin="0" end="${b.board_re_lev}">
				&nbsp;
			</c:forEach>
		</c:if>
		<c:if test="${b.board_re_lev > 0}">
			Re.
		</c:if>
		<a href="./BoardDetailAction.do?board_num=${b.board_num}&page=${page}">
			 ${b.board_subject}
		</a>
		
		</td>	
		<td>${b.board_name}</td>	
		<td>
		
		<fmt:formatDate value="${b.board_date}" pattern="yyyy-MM-dd H:mm"/>
		
		</td>	
		<td>${b.board_readcount}</td>	
	</tr>
	</c:forEach>

</table><br>


<center>
<c:if test="${listcount > 0}">

	<a href="./BoardListAction.do?page=1" style="text-decoration:none"> < </a>

	<c:if test="${startPage > 10}">
		<a href="./BoardListAction.do?page=${startPage - 10}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == page}">
			[${i}]
		</c:if>
		<c:if test="${i != page}">
			<a href="./BoardListAction.do?page=${i}">[${i}]</a>
		</c:if>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="./BoardListAction.do?page=${startPage + 10}">[다음]</a>
	</c:if>
	
	<a href="./BoardListAction.do?page=${pageCount}" style="text-decoration:none"> > </a>	

</c:if>
</center>








    
    