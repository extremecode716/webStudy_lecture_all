<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean"%>

<%  // 한글값이 post방식으로 전송될때 utf-8로 인코딩을 시켜주는 역할
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="board.BoardDataBean"/> 
<jsp:setProperty property="*" name="board"/>   

<%
	// 글을 작성한 사용자의 ip주소를 구해오는 메소드
	String ip = request.getRemoteAddr();
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

