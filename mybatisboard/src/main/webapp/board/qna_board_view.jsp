<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<table border=1 width=600 align=center>
	<caption>상세 페이지</caption>
	<tr>
		<td>작성자</td>
		<td>${board.board_name}</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${board.board_readcount}</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>
			<fmt:formatDate value="${board.board_date}"
							pattern="yyyy-MM-dd H:mm"/>		
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${board.board_subject}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><pre>${board.board_content}</pre></td>
	</tr>
	<tr>
		<td>첨부 파일</td>
		<td>
			<c:if test="${board.board_file !=  null }">
				<a href="./board/file_down.jsp?file_name=${board.board_file}">${board.board_file}</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="댓글" 
				   onClick="location.href='./BoardReplyAction.do?board_num=${board.board_num}&page=${page}&board_re_ref=${board.board_re_ref}&board_re_lev=${board.board_re_lev}&board_re_seq=${board.board_re_seq}'">
			<input type="button" value="수정" 
				   onClick="location.href='./BoardModifyAction.do?board_num=${board.board_num}&page=${page}'">
			<input type="button" value="삭제" 
				   onClick="location.href='./BoardDeleteAction.do?board_num=${board.board_num}&page=${page}'">
			<input type="button" value="목록" 
			       onClick="location.href='./BoardListAction.do?page=${page}'">
		</td>
	</tr>
</table>    
