<%@ page contentType="text/html;charset=euc-kr"%>

<HTML>
<HEAD>
<TITLE>간단한 표현언어(EL)예제</TITLE>
</HEAD>

<BODY>

<H3>간단한 표현언어(EL)예제</H3>
<P>
연산자를 사용한 예와 내장객체의 사용한 예:

<TABLE BORDER="1">
  <THEAD>
    <TD><B>표현식</B></TD>
    <TD><B>값</B></TD>
  </THEAD>
  <TR>
    <TD>\${2 + 5}</TD>
    <TD>${2 + 5}</TD>
  </TR>
  <TR>
    <TD>\${4/5}</TD>
    <TD>${4/5}</TD>
  </TR>
  <TR>
    <TD>\${5 div 6}</TD>
    <TD>${5 div 6}</TD>
  </TR>
  <TR>
    <TD>\${5 mod 7}</TD>
    <TD>${5 mod 7}</TD>
  </TR>
  <TR>
    <TD>\${2 < 3}</TD>
    <TD>${2 < 3}</TD>
  </TR>
  <TR>
    <TD>\${2 gt 3}</TD>
    <TD>${2 gt 3}</TD>
  </TR>
  <TR>
    <TD>\${3.1 le 3.2}</TD>
    <TD>${3.1 le 3.2}</TD>
  </TR>
  <TR>
    <TD>\${(5 > 3) ? 5 : 3}</TD>
    <TD>${(5 > 3) ? 5 : 3}</TD>
  </TR>
  <TR>
    <TD>\${header["host"]}</TD>
    <TD>${header["host"]}</TD>
  </TR>
  <TR>
    <TD>\${header["user-agent"]}</TD>
    <TD>${header["user-agent"]}</TD>
  </TR>
</TABLE>
</BODY>
</HTML>