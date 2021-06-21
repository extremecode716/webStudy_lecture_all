<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% 
	String pagefile = request.getParameter("page");
	if(pagefile == null){ pagefile = "bestitem";}
%>    
    
<html>
	<head><title>Template Test</title></head>
	<body>
	<table width=960 height=500 border=1 color=gray align=center>
		<tr><td height=43 colspan=2 align=left>
				<jsp:include page="top.jsp" />
			</td>
		</tr>
		<tr><td width=15% align=right valign=top>
				<jsp:include page="left.jsp" />
			</td>
			<td colspan=2 align=center>
				<jsp:include page='<%= pagefile+".jsp" %>'/>
			</td>
		</tr>
		<tr><td width=100% height=40 colspan=3>
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
	</table>
	</body>
</html>    