<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border=1 width=400 align=center>
	<caption>상세 페이지</caption>
	<tr><td>제목</td>
		<td>${board.board_subject }</td>
	</tr>
	<tr><td>내용</td>
		<td>
			<%-- <pre>${board.board_content }</pre> --%>
				
			${board_content}
		</td>	
	</tr>
	<tr><td>첨부 파일</td>
		<td>
			<!-- 첨부파일이 있을때만 첨부파일 출력 -->
			<c:if test="${board.board_file != null }">
<a href="./board/file_down.jsp?file_name=${board.board_file}">			
					${board.board_file }
			</a>		
			</c:if>
		</td>
	</tr>
	<tr><td colspan=2 align=center>
	
				<input type="button" value="댓글" 
onClick="location.href='./BoardReplyAction.do?board_num=${board.board_num}&page=${page}' ">
				
				<input type="button" value="수정" 
onClick="location.href='./BoardModifyAction.do?board_num=${board.board_num}&page=${page}' ">
				
				<input type="button" value="삭제" 
onClick="location.href='./BoardDeleteAction.do?board_num=${board.board_num}&page=${page}' ">
				
				<input type="button" value="목록" 
onClick="location.href='./BoardListAction.do?page=${page}' ">
				
		</td>
	</tr>
	
</table>