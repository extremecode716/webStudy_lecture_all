<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>forTokens �±�</title>
</head>
<body>

	�޸��� ���� �����ڷ� ���:
	<br>
	<c:forTokens var="token" items="������,��Ȳ��.�����.�ʷϻ�,�Ķ���,����.�����" delims=",.">
${token} 
</c:forTokens>

</body>
</html>
