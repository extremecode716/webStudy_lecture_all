<%@ page contentType="text/html; charset=euc-kr" %>

<html>
	<head>
		<title>�� �������� ����� ��Ű�� �������� ����</title>
	</head>
	<body>
	<h2>�� �������� ����� ��Ű�� �������� ����</h2>

<%
	Cookie[] cook = request.getCookies();

	if( cook != null ){
		for(int i=0; i<cook.length;++i){
			if(cook[i].getName().equals("id")){
%>

		��Ű�� �̸��� "<%=cook[i].getName()%>" �̰� 
		��Ű�� �� "<%=cook[i].getValue()%>" �Դϴ�.

<%
			}
		}
	}
%>

	</body>
</html>
