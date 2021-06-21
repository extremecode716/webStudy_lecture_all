<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="true">
	무조건 실행 <br>
</c:if>

<c:if test="${param.name == 'toto'}">
	name 파라미터의 값이 ${param.name} 입니다. <br>
</c:if>

<c:if test="${param.age > 20}">
	당신의 나이는 20세 이상 입니다. <br>
</c:if>