<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- ID :
<%=request.getParameter("id")%>
<br>
비밀번호 :
<%=request.getParameter("passwd")%> --%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="member" class="member.MemberDTO" />
<jsp:setProperty property="*" name="member" />

<%
MemberDAO dao = MemberDAO.getInstance();
int result = dao.memberCheck(member); // 회원 인증 처리

if (result == 1) { // 회원 인증 성공
	session.setAttribute("id", member.getId()); // 세션 공유 설정
%>
<script>
	alert("로그인 성공");
	location.href = "main.jsp";
</script>
<%
} else { //회원 인증 실패
%>
<script>
	alert("로그인 실패");
	history.go(-1);
</script>
<%
}
%>

