<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="JavaBeanMember.register.LogonDBBean"%>
<%@ page import="JavaBeanMember.register.LogonDataBean"%>
<%@ include file="color.jsp"%>

<%
String id = request.getParameter("id");
%>


<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<form name="regForm" method="post" action="deletePro.jsp" onsubmit="return inputCheck()">
		<input type=hidden name=id value="<%=id%>">
		<table width="500" border="0" cellspacing="0" cellpadding="2" align="center">
			<tr height="39" align="center" bgcolor="<%=title_c%>">
				<td colspan="3">
					<b>ȸ�� ����</b></font>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="<%=title_c%>">��й�ȣ</td>
				<td width="200" bgcolor="<%=value_c%>">
					<input type="password" name="passwd" size="20">
				</td>
				<td width="200" bgcolor="<%=value_c%>">��й�ȣ�� �Է��ϼ���</td>
			</tr>
			<tr>
				<td colspan="3" align="center" bgcolor="<%=title_c%>">
					<input type="submit" value="ȸ������">
					&nbsp; &nbsp; &nbsp; &nbsp;
					<input type="reset" value="�ٽ��ۼ�">
				</td>
			</tr>
			</form>
		</table>
</body>
</html>
