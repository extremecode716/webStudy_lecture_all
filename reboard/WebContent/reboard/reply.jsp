<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reboard.BoardDBBean"%>

<%
	request.setCharacterEncoding("utf-8");
%> 

<jsp:useBean id="board" class="reboard.BoardDataBean"/> 
<jsp:setProperty property="*" name="board"/> 

<%
	String nowpage = request.getParameter("page");
	board.setIp(request.getRemoteAddr());
	
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.reply(board);		// 댓글 작성
	
	if(result == 1){
%>
		<script>
			alert("댓글작성 성공");
			location.href="list.jsp?page=<%=nowpage%>";
		</script>

<%	}else{ %> 
		<script>
			alert("댓글 작성 실패");
			history.go(-1);
		</script>
<%	} %>