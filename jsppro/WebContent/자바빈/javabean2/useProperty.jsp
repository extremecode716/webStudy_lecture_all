<%@ page contentType = "text/html; charset=euc-kr" %>

<jsp:useBean id="member" class="madvirus.member.MemberInfo" />
<jsp:setProperty name="member" property="name" value="�ֹ���" />
<jsp:setProperty name="member" property="id" value="CBK" />

<html>
		<head><title>������Ƽ���</title></head>
		<body>

		<jsp:getProperty name="member" property="name" />����
		���̵�� <jsp:getProperty name="member" property="id" /> �Դϴ�.

		</body>
</html>