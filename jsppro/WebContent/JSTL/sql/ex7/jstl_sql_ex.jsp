<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
<title>JSTL sql ���̺귯�� ��� ����</title>
</head>
<body>

<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver" 
				url="jdbc:oracle:thin:@localhost:1521:xe"
				user="scott" 
				password="716"/>

<sql:update dataSource="${conn}">
	INSERT INTO test (num, name) VALUES (1, 'ȫ�浿')
</sql:update>
<sql:update dataSource="${conn}">
	INSERT INTO test (num, name) VALUES (2, '���ص�')
</sql:update>
<sql:update dataSource="${conn}">
	INSERT INTO test (num, name) VALUES (3, 'ȫ�浿')
</sql:update>
<sql:update dataSource="${conn}">
	INSERT INTO test (num, name) VALUES (4, 'ȫ���')
</sql:update>

<sql:query var="rs" dataSource="${conn}">
	SELECT * FROM test WHERE name=?
	<sql:param>ȫ�浿</sql:param>
</sql:query>

<c:forEach var="data" items="${rs.rows}">
	<c:out value="${data['num']}"/>
	<c:out value="${data['name']}"/>
	<br>
</c:forEach>

</body>
</html>
