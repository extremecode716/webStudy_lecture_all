<%@ page contentType="text/html;charset=euc-kr"%>

<%
   String name = request.getParameter("name");
   String selectedColor = request.getParameter("selectedColor");
%>

<h2>�������Ǵ� ������ - <%=selectedColor+".jsp"%></h2>

<b><%=name%></b>���� �����ϴ� ���� "<%=selectedColor%>"�̰�
�ڱ�Ž���� ���������� ��¡�ϴ� ���Դϴ�.<br><br>

<img src="<%=selectedColor+".jpg"%>" border="0" width="70" height="30">