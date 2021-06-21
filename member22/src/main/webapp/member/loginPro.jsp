<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDao"%>

<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>

<%
MemberDao md = new MemberDao();
int result = md.chk(mem);

if (result==1) {
	session.setAttribute("id",mem.getId());
%> 
	<script type="text/javascript">
		alert("환영함");
		location.href="main.jsp";
	</script>
<%
} else if (result == -1) {
%> 
	<script type="text/javascript">
		alert("비번이 다르다");
		history.go(-1);
	</script>
<%
} else {
%> 
	<script type="text/javascript">
		alert("그런 ID가 없습니다.");
		history.go(-1);
	</script>
<%
}
%>
