<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="JavaBeanMember.register.LogonDBBean" %>  
<%@ page import="JavaBeanMember.register.LogonDataBean" %>  
<%@ include file="color.jsp" %>

<%
	String id = request.getParameter("id");

	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean db = manager.updateForm(id);
%>


<html>
<head>
	<title>ȸ������</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
  <form name="regForm" method="post" action="updatePro.jsp" onsubmit="return inputCheck()">
    <input type=hidden name=id value="<%=db.getId() %>">
    <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="39" align="center" bgcolor="<%=title_c%>"> 
         <td colspan="3"><b>ȸ�� ����</b></font></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">���̵�</td>
        <td width="200" bgcolor="<%=value_c%>"> 
        	<%=db.getId() %>
		 <!--  <input type="text" name="id" size="20"> --> </td>
        <td width="200" bgcolor="<%=value_c%>">���̵� �Է��ϼ���.</td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">��й�ȣ</td> 
        <td width="200" bgcolor="<%=value_c%>"> 
	      <input type="password" name="passwd" size="20"> </td>
      <td width="200" bgcolor="<%=value_c%>">��й�ȣ�� �Է��ϼ���</td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">��й�ȣ Ȯ��</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="password" name="repasswd" size="20"> </td>
        <td width="200" bgcolor="<%=value_c%>">��й�ȣ�� ���Է��ϼ���.</td>
      </tr>
      <tr>  
        <td width="100" bgcolor="<%=title_c%>">�̸�</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="name" size="20" value="<%=db.getName()%>"> </td>
        <td width="200" bgcolor="<%=value_c%>">�̸��� �Է��ϼ���.</td>
      </tr>
      <tr>  
        <td width="100" bgcolor="<%=title_c%>">�ֹι�ȣ</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="jumin1" size="6" maxlength=6 value="<%=db.getJumin1()%>">-
		  <input type="text" name="jumin2" size="7" maxlength=7 value="<%=db.getJumin2()%>"> </td>
        <td width="200" bgcolor="<%=value_c%>">�ֹι�ȣ�� �Է��ϼ���.</td>
      </tr>
      <tr> 
         <td width="100" bgcolor="<%=title_c%>">�̸���</td>
         <td width="200" bgcolor="<%=value_c%>"> 
		   <input type="text" name="email" size="30" value="<%=db.getEmail()%>"> </td>
         <td width="200" bgcolor="<%=value_c%>">�̸����� �Է��ϼ���.</td>
      </tr>
      <tr>  
         <td width="100" bgcolor="<%=title_c%>">��α�</td>
         <td width="200" bgcolor="<%=value_c%>"> 
		   <input type="text" name="blog" size="20" value="<%=db.getBlog()%>"> </td>
         <td width="200" bgcolor="<%=value_c%>">��α׸� �Է��ϼ���.</td>
      </tr>
      <tr> 
         <td colspan="3" align="center"  bgcolor="<%=title_c%>"> 
           <input type="submit" value="ȸ������" > 
              &nbsp; &nbsp; &nbsp; &nbsp;
           <input type="reset" value="�ٽ��ۼ�"> 
         </td>
       </tr>
    </form>
  </table>
</body>
</html>
