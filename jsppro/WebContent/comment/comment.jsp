<%@ page contentType="text/html;charset=euc-kr" %>

<html>

<!-- HTML에서 제목을 출력합니다.(html 주석) -->

두 개의 숫자를 더해서 결과를 출력합니다 : <br>

<%-- 계산 결과는 자바 코드로 출력합니다.(jsp 주석) --%>

<body>

<%
/* 두 개의 정수형 변수에
   값을 할당하고 계산합니다. */

int i=1;
int j=2;
i=i+j;

out.println("i+j = " + i); //계산된 결과를 출력합니다.
%>

</body>
</html>   
