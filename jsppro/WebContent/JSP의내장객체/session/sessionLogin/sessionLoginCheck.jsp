<%@ page contentType = "text/html; charset=euc-kr" %>
<%
    String memberId = (String)session.getAttribute("MEMBERID");

	//���ǿ�����(3�� ������)
	// (���ǽ�) ? a : b
	// -> ���ǽ��� true�̸� a��, false�� b�� �����

    boolean login = memberId == null ? false : true;
%>

<html>
	<head><title>�α��ο��� �˻�</title></head>
	<body>

<%
    if (login) {
%>
		���̵� "<%= memberId %>"�� �α��� �� ����
		
		<a href="sessionLogout.jsp">�α׾ƿ�</a> <br><br>
<%
    } else {
%>
		�α������� ���� ���� <br><br>
			
		<a href="sessionLoginForm.jsp">�α���</a> <br><br>
		
		<a href="../../request/member/memberform.html">ȸ������</a>
<%
    }
%>

	</body>
</html>
