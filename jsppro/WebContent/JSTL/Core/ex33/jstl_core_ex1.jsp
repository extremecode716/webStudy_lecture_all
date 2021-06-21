<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>JSTL core ���̺귯�� ��� ���� 1</title>
</head>
<body>
<c:set var="test" value="Hello JSTL!"/>
<h3>&lt;c:set&gt; ��� �� : <c:out value="${test}"/></h3>
<c:remove var="test"/>
<h3>&lt;c:remove&gt; ��� �� : <c:out value="${test}"/></h3>

<c:catch var="err">
<%=10/0%>
</c:catch>
<h3>&lt;c:catch&gt;�� ��Ƴ� ���� : <c:out value="${err}"/></h3>

<c:if test="${5<10}">
<h3>5�� 10���� �۴�.</h3>
</c:if>
<c:if test="${6+3==9}">
<h3>6 + 3 �� 9�̴�.</h3>
</c:if>

<c:choose>
	<c:when test="${5+10==50}">
		<h3>5+10�� 50�̴�.</h3>
	</c:when>
	
	<c:otherwise>
		<h3>5+10�� 50�� �ƴϴ�.</h3>
	</c:otherwise>
</c:choose>
</body>
</html>
