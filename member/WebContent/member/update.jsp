<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>

<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="member.MemberDTO" /> 
<jsp:setProperty property="*" name="member"/>   

<%

    String[] hobby = request.getParameterValues("hobby");
    // 취미를 하이픈을 붙여서 저장 : ex) 공부-게임-등산-
    String h = "";
    for(String h1 : hobby){
        h += h1 + "-";          // h= "공부-게임-등산-"
    }
    member.setHobby(h);
    
    MemberDAO dao = MemberDAO.getInstance();
    
    // 한 사람의 정보를 구해오기
    MemberDTO old = dao.getMember(member.getId());  
    
    // 비번 비교
    if(old.getPasswd().equals(member.getPasswd())){ // 비번 일치시
        int result = dao.update(member);
        if(result == 1){
%>
            <script>
                alert("회원정보 수정 성공");
                location.href="main.jsp";
            </script>
<%      }
    }else{  // 비번 불일치시  %>
            <script>
                alert("비밀번호가 일치하지 않습니다.");
                history.go(-1);
            </script>
<%  }%>