<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reboard.BoardDBBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>    

<jsp:useBean id="board" class="reboard.BoardDataBean"/> 
<jsp:setProperty property="*" name="board"/>  

<%
	String ip =  request.getRemoteAddr();
	board.setIp(ip);
	
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.insert(board);
	
	if(result == 1){		
%> 
		<script>
			alert("글작성 성공");
			location.href="list.jsp";
		</script>

<%	}else{ %>
		<script>
			alert("글작성 실패");
			history.go(-1);
		</script>
<%	} %>
