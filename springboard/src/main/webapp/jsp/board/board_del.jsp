<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시물 삭제</title>
	<link rel="stylesheet" type="text/css" href="./css/board.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
 	 function del_check(){
		  if($.trim($("#pwd").val())==""){
			  alert("삭제 비번을 입력하세요!");
			  $("#pwd").val("").focus();
			  return false;
	 	 }
  	}
	</script>
</head>

<body>
 <div id="boarddel_wrap">
  <h2 class="boarddel_title">게시물 삭제</h2>
  <form method="post" action="board_del_ok.do" 
  onsubmit="return del_check()">
  <input type="hidden" name="board_num" value="${bcont.board_num}" />
  <input type="hidden" name="page" value="${page}" />
   <table id="boarddel_t">
    <tr>
     <th>삭제 비밀번호</th>
     <td>
      <input type="password" name="pwd" id="pwd" size="14" 
      class="input_box" />
     </td>
    </tr>
   </table>
   <div id="boarddel_menu">
    <input type="submit" value="삭제" class="input_button" />
    <input type="reset" value="취소" class="input_button" 
    onclick="$('#pwd').focus();" />
   </div>
  </form>
 </div>
</body>
</html>
