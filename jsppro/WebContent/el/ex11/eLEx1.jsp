<%@ page contentType="text/html;charset=euc-kr"%>

<HTML>
<HEAD>
<TITLE>������ ǥ�����(EL)����</TITLE>
</HEAD>

<BODY>

<H3>������ ǥ�����(EL)����</H3>
<P>
�����ڸ� ����� ���� ���尴ü�� ����� ��:

<TABLE BORDER="1">
  <THEAD>
    <TD><B>ǥ����</B></TD>
    <TD><B>��</B></TD>
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