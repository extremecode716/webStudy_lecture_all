<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");

MemberDAO dao = MemberDAO.getInstance();
int result = dao.memberAuth(id);
System.out.println("result:" + result); // 서버 콘솔 출력
// result : 1 (중복 ID)
// result : -1 (사용 가능한 ID)

out.print(result); // 1. 브라우저에 출력되는 값이 callback함수로 리턴된다. (내장객체 out로 )

/* <%= result> */ // 2. 브라우저에 출려되는 값이 callback함수로 리턴된다. (표현식 태그로 )
%>