<%@ page contentType="text/html;charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr");%>

<HTML>
<HEAD>
<TITLE>ǥ������� ��뿹��2</TITLE>
</HEAD>

<BODY>

<H3>ǥ������� ��뿹��2 -�Ķ���Ͱ� ó��</H3>
<P>
<FORM action="eLEx2.jsp" method="post">
   �̸� : <input type="text" name="name" value="${param['name']}">
          <input type="submit" value="Ȯ��">
</FORM>

<P>
�̸���: ${param.name} �Դϴ�.

</BODY>
</HTML>
