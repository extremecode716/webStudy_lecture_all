<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String filename1=request.getParameter("filename1");
	String filename2=request.getParameter("filename2");
	//아래 두줄 추가
	String origfilename1=request.getParameter("origfilename1");
	String origfilename2=request.getParameter("origfilename2");
	
	
%>
<html>
<head>
<title>파일 업로드 확인 및 다운로드</title>
</head>
<body>
올린 사람 : <%=name %><br>
제목 : <%=subject %><br>
<!-- 파일 명 링크 거는 부분 수정함. -->
파일명1 : <a href="file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %></a><br>
파일명2 : <a href="file_down.jsp?file_name=<%=filename2 %>"><%=origfilename2 %></a><p>
</body>
</html>
