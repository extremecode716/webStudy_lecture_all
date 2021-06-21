<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    ID : <%=request.getParameter("id")%> <br>
    password : <%=request.getParameter("password")%> <br>
    
    request 객체로 공유한 값 출력 <br>
    <%=request.getAttribute("name")%>