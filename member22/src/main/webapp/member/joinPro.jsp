<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*"%>

<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>

<%
MemberDao md = new MemberDao();
int result = md.insert(mem);

if (result>0) {
%> 
	<script type="text/javascript">
		alert("가입성공");
		location.href="loginForm.jsp";
	</script>
<%
} else {
%> 
	<script type="text/javascript">
		alert("가입 실패");
		history.go(-1);
	</script>
<%
}
%>
