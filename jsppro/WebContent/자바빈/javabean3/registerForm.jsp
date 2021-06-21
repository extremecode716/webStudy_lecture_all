<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>

<html>
<head>
	<title>회원가입</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
  <form name="regForm" method="post" action="registerPro.jsp" onsubmit="return inputCheck()">
    <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="39" align="center" bgcolor="<%=title_c%>"> 
         <td colspan="3"><b>회원 가입</b></font></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">아이디</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="id" size="20"> </td>
        <td width="200" bgcolor="<%=value_c%>">아이디를 입력하세요.</td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">비밀번호</td> 
        <td width="200" bgcolor="<%=value_c%>"> 
	      <input type="password" name="passwd" size="20"> </td>
      <td width="200" bgcolor="<%=value_c%>">비밀번호를 입력하세요</td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>">비밀번호 확인</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="password" name="repasswd" size="20"> </td>
        <td width="200" bgcolor="<%=value_c%>">비밀번호를 재입력하세요.</td>
      </tr>
      <tr>  
        <td width="100" bgcolor="<%=title_c%>">이름</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="name" size="20"> </td>
        <td width="200" bgcolor="<%=value_c%>">이름을 입력하세요.</td>
      </tr>
      <tr>  
        <td width="100" bgcolor="<%=title_c%>">주민번호</td>
        <td width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="jumin1" size="6" maxlength=6>-
		  <input type="text" name="jumin2" size="7" maxlength=7> </td>
        <td width="200" bgcolor="<%=value_c%>">주민번호를 입력하세요.</td>
      </tr>
      <tr> 
         <td width="100" bgcolor="<%=title_c%>">이메일</td>
         <td width="200" bgcolor="<%=value_c%>"> 
		   <input type="text" name="email" size="30"> </td>
         <td width="200" bgcolor="<%=value_c%>">이메일을 입력하세요.</td>
      </tr>
      <tr>  
         <td width="100" bgcolor="<%=title_c%>">블로그</td>
         <td width="200" bgcolor="<%=value_c%>"> 
		   <input type="text" name="blog" size="20"> </td>
         <td width="200" bgcolor="<%=value_c%>">블로그를 입력하세요.</td>
      </tr>
      <tr> 
         <td colspan="3" align="center"  bgcolor="<%=title_c%>"> 
           <input type="submit" value="회원가입" > 
              &nbsp; &nbsp; &nbsp; &nbsp;
           <input type="reset" value="다시작성"> 
         </td>
       </tr>
    </form>
  </table>
</body>
</html>
