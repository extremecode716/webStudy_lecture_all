<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>

<c:if test="${sessionScope.id == null }"> 
  <script>
   alert("다시 로그인 해주세요!");
   location.href="<%=request.getContextPath()%>/member_login.nhn";
  </script>
</c:if>

<c:if test="${sessionScope.id != null }">  
 <div id="main_wrap">
   <h2 class="main_title">사용자 메인화면</h2>  
   <form method="post" action="member_logout.nhn"> 
   <table id="main_t">
    <tr>
     <th colspan="2">
     <input type="button" value="정보수정" class="input_button"
     		onclick="location='member_edit.nhn'" />
     <input type="button" value="회원탈퇴" class="input_button"
     		onclick="location='member_del.nhn'" />
     <input type="submit" value="로그아웃" class="input_button" />     
     </th>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>${join_name}님 로그인을 환영합니다</td>
    </tr>
    
    <tr>
     <th>프로필사진</th>
     <td>
       <c:if test="${empty join_profile}">
       &nbsp;
       </c:if>
       <c:if test="${!empty join_profile}">
       <img src="<%=request.getContextPath() %>/upload/${join_profile}" height="100" width="100" />
       </c:if>
     </td>
    </tr>
   </table>   
   </form>
 </div>
</c:if>

</body>
</html>