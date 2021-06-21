<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="JavaBeanMember.register.LogonDataBean"%>
<%@ page import="JavaBeanMember.register.LogonDBBean"%>
<%@include file="color.jsp"%>

<%
request.setCharacterEncoding("euc-kr");

//LogonDataBean regBean1 = new LogonDataBean();
// regBean1.id="test";
%>

<jsp:useBean id="regBean" class="JavaBeanMember.register.LogonDataBean" />
<jsp:setProperty name="regBean" property="*" />

<%
//	regBean.id="test";
%>


<%
LogonDBBean manager = LogonDBBean.getInstance();
int result = manager.insertMember(regBean);

if (result == 1) {
%>
<script>
	alert("회원가입 성공");
	location.href = "list.jsp";
</script>

<%
} else {
%>

<script>
	alert("회원가입 실패");
	history.go(-1);
</script>

<%
}
%>


<%-- <html>
<head>
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
    <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="39" align="center" bgcolor="<%=title_c%>"> 
        <td colspan="2"><b>회원 가입 확인</b></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">아이디</td>
        <td width="400" bgcolor="<%=value_c%>">
		  <jsp:getProperty name="regBean" property="id" /></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">비밀번호</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="passwd" /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">이름</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="name" /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">이메일</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="email" /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">블로그</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="blog" /> </td>
      </tr>
  </table>
</body>
</html> --%>
