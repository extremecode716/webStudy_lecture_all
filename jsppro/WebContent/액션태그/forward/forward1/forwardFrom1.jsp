<%@ page contentType="text/html;charset=euc-kr"%>

<html>
	<body>
	<h2>�������ϴ� ������: forwardFrom1.jsp</h2>

	<%
		request.setCharacterEncoding("euc-kr");
	%>

   forwardFrom1.jsp�� ���� �Դϴ�.<br>
   ȭ�鿡 ���� ǥ�� �ȵ˴ϴ�.

	<%	// request ��ü�� ���� ����
		request.setAttribute("name","ȫ�浿");
	%>
	
	<jsp:forward page="forwardTo1.jsp"/>  

	</body>
</html>