<%@ page contentType = "text/html; charset=euc-kr" %>

<%
   String contentPage = request.getParameter("CONTENTPAGE");
%>

<html>
	<head><title>Template ������ ����</title></head>

	<body>

	<table width="600" border="1" cellpadding="2" cellspacing="0" align=center>
		<tr height=80>
			<td colspan="2">
                <!-- ��� ���� -->
				<jsp:include page="top.jsp" flush="false" />

			</td>
		</tr>
		<tr height=300>
			<td width="150" valign="top">
				<!-- ���� ���� -->
				<jsp:include page="left.jsp" flush="false" />

			</td>
			<td width="350" valign="top">
				<!-- ���� ���� -->
				<jsp:include page="<%= contentPage %>" flush="false" />

			</td>
		</tr>
		<tr height=80>
			<td colspan="2">
				<!-- �ϴ� ���� -->
				<jsp:include page="bottom.jsp" flush="false" />

		    </td>
		</tr>
	</body>
</html>