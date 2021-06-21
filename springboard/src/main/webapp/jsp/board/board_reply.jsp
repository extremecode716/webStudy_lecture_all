<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시판 답변 달기</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="./js/board.js"></script>
</head>

<body>
 <div id="boardreply_wrap">
  <h2 class="boardreply_title">게시판 답변달기</h2>
  <form method="post" action="board_reply_ok.do">  
  <input type="hidden" name="board_num" value="${bcont.board_num}" />
  <input type="hidden" name="board_re_ref" value="${bcont.board_re_ref}" />
  <input type="hidden" name="board_re_lev" value="${bcont.board_re_lev}" />
  <input type="hidden" name="board_re_seq" value="${bcont.board_re_seq}" />
  <input type="hidden" name="page" value="${page}" />
  
   <table id="boardreply_t">
    <tr>
     <th>글쓴이</th>
     <td>
      <input name="board_name" id="board_name" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
      <input type="password" name="board_pass" id="board_pass"
      size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글제목</th>
     <td>
      <input name="board_subject" id="board_subject" size="40"
      class="input_box" value="Re:${bcont.board_subject}" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="board_content" id="board_content" rows="8" 
      cols="50" class="input_box" ></textarea>
     </td>
    </tr>
   </table>
   <div id="boardreply_menu">
    <input type="submit" value="답변" class="input_button" />
    <input type="reset" value="취소" class="input_button"
    onclick="$('#board_name').focus();" />
   </div>
  </form>
 </div>
</body>
</html>