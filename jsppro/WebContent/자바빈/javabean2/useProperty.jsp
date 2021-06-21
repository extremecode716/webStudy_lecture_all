<%@ page contentType = "text/html; charset=euc-kr" %>

<jsp:useBean id="member" class="madvirus.member.MemberInfo" />
<jsp:setProperty name="member" property="name" value="최범균" />
<jsp:setProperty name="member" property="id" value="CBK" />

<html>
		<head><title>프로퍼티사용</title></head>
		<body>

		<jsp:getProperty name="member" property="name" />님의
		아이디는 <jsp:getProperty name="member" property="id" /> 입니다.

		</body>
</html>