<%@page import="upload.BoardDataBean"%>
<%@page import="upload.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>  

<jsp:useBean id="upload" class="upload.BoardDataBean"/>  
<jsp:setProperty property="*" name="upload"/>

<%
	String nowpage = request.getParameter("page");

	String path = request.getRealPath("upload");
	System.out.println("path:"+ path);

	BoardDBBean dao = BoardDBBean.getInstance();
	BoardDataBean old = dao.getContent(upload.getNum());
	
	// 비번 비교
	if(old.getPasswd().equals(upload.getPasswd())){	// 비번 일치시
		int result = dao.delete(old, path);	// 글삭제, 첨부파일 삭제
		if(result == 1){
%>
			<script>
				alert("글삭제 성공");
				location.href="list.jsp?page=<%=nowpage%>";
			</script>
<%		}
	}else{ // 비번 불일치시		%>
			<script>
				alert("비번이 일치하지 않습니다.");
				history.go(-1);
			</script>
<%	} %>
