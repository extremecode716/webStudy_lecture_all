<%@ page contentType="text/html;charset=euc-kr" buffer="4kb"%>

<%
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer - remainBuffer;
%>

<h1>Out ����</h1>
<b>���� �������� Buffer ����</b><p>

��� Buffer�� ��ü ũ�� : <%=totalBuffer%>byte<p>
���� Buffer�� ��뷮 : <%=useBuffer%>byte<p>
���� Buffer�� ũ�� : <%=remainBuffer%>byte<p>