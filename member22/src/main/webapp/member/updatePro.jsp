<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDao"%>
<%@page import="model.Member"%>

<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>

<%
	MemberDao md = new MemberDao();
	int result = md.update(mem);

if (result == 1) {
%>
	<script type="text/javascript">
		alert("수정 성공");
		location.href="list.jsp";
	</script>
<%
} else {
%>
	<script type="text/javascript">
		alert("수정 실패");
		history.go(-1);
	</script>
<%
}
%>

