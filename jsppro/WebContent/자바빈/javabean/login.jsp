<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>    

ID : <%=id%> <br>
비밀번호 :  <%=passwd%> <br>

<%	if(id.equals("jsp") && passwd.equals("1234")){ %>
		<%="로그인 성공" %>		
<%	}else{ %>
		<%="로그인 실패"%> 	
<%	} %>

