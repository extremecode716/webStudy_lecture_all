
  function check(){
	  if($.trim($("#bbs_name").val())==""){
		  alert("글쓴이를 입력하세요!");
		  $("#bbs_name").val("").focus();
		  return false;
	  }
	  if($.trim($("#bbs_pass").val())==""){
		  alert("비밀번호를 입력하세요!");
		  $("#bbs_pass").val("").focus();
		  return false;
	  }
	  if($.trim($("#bbs_subject").val())==""){
		  alert("글제목을 입력하세요!");
		  $("#bbs_subject").val("").focus();
		  return false;
	  }
	  if($.trim($("#bbs_content").val())==""){
		  alert("글내용을 입력하세요!");
		  $("#bbs_content").val("").focus();
		  return false;
	  }
  }