<%@ page contentType="text/html;charset=euc-kr" %>
<jsp:useBean id="login" class="beans.LoginBean" />
<jsp:setProperty name="login" property="*" />

<HTML>
	<HEAD><TITLE> 로그인 예제 </TITLE></HEAD>
<BODY>
<center>
<H2>로그인 예제</H2>
<HR>

<% 
	if(!login.checkUser()) {
		out.println("로그인 실패 !!");	
	}else {
		out.println("로그인 성공 !!");
	}
%>

<HR>
사용자 아이디 : <jsp:getProperty name="login"  property="userid" /><BR>
사용자 패스워드 : <jsp:getProperty name="login" property="passwd" />
</BODY>
</HTML>