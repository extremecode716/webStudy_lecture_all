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
	alert("ȸ������ ����");
	location.href = "list.jsp";
</script>

<%
} else {
%>

<script>
	alert("ȸ������ ����");
	history.go(-1);
</script>

<%
}
%>


<%-- <html>
<head>
<title>ȸ������ Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
    <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="39" align="center" bgcolor="<%=title_c%>"> 
        <td colspan="2"><b>ȸ�� ���� Ȯ��</b></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">���̵�</td>
        <td width="400" bgcolor="<%=value_c%>">
		  <jsp:getProperty name="regBean" property="id" /></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">��й�ȣ</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="passwd" /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">�̸�</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="name" /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">�̸���</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="email" /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">��α�</td>
        <td width="400" bgcolor="<%=value_c%>"> 
		  <jsp:getProperty name="regBean" property="blog" /> </td>
      </tr>
  </table>
</body>
</html> --%>
