<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl core 태그라이브러리 -->
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<script src="./js/jquery.js"></script>
</head>
<body>
 <div id="adminmain_wrap">
   <!-- 상단 메뉴 -->
   <div id="adminmain_header">
     <div id="adminheader_left">
      <div id="admin_home">
       <a href="admin_main.nhn" onfocus="this.blur()">홈</a>       
      </div>            
            
      <h3 class="adminheader_title">관리자 모드 메뉴입니다.</h3>
      <ul>
       <li>
       <a href="/spring3/adminGongji_List.nhn" onfocus="this.blur()">공지사항</a>
       </li>
       <li>
       <a href="/spring3/admin_board_list.nhn" onfocus="this.blur()">게시판</a>
       </li>
       <li>
       <a href="/spring3/admin_bbs_list.nhn" onfocus="this.blur()">자료실</a>
       </li>
       <li>
        <a href="/spring3/admin_member_list.nhn" onfocus="this.blur()">회원관리</a>
       </li>
      </ul>     
     </div>
     
     <div id="adminheader_right">
     <c:if test="${!empty admin_id}">  
      <form method="post" action="admin_logout.nhn">
      <ul>
        <li><b>${admin_name}</b>&nbsp;님 로그인을 환영합니다.</li>
        <li><input type="submit" value="로그아웃" class="input_button" /></li>
       </ul> 
       </form> 
     </c:if>
     <c:if test="${empty admin_id}">  
       <script>
        alert("다시 로그인 해주세요!");
        location="admin_index.nhn";
       </script>       
     </c:if>  
     </div>
   </div>
 