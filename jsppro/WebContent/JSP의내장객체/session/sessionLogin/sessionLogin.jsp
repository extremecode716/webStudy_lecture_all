<%@ page contentType = "text/html; charset=euc-kr" %>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if (id.equals(password)) {
        session.setAttribute("MEMBERID", id);
%>

		<html>
			<head><title>�α��μ���</title></head>
			<body>

				�α��ο� �����߽��ϴ�.
				<script>
					alert("�α��� ����");
					location.href="sessionLoginCheck.jsp";
				</script>

			</body>
		</html>

<%
    } else { // �α��� ���н�
%>

		<script>
			alert("�α��ο� �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
    }
%>
