$(function(){
		$("form").submit(function(){
			if($.trim($("#writer").val()) == ""){
				alert("작성자명을 입력하세요.");
				$("#writer").focus();
				return false;
			}
			if($.trim($("#passwd").val()) == ""){
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return false;
			}
			if($("#passwd").val().length <2 || 
			   $("#passwd").val().length >8	){
				alert("비밀번호는 2~8자로 입력하세요");
				$("#passwd").val("").focus();
				return false;
			}
			if($.trim($("#subject").val()) == ""){
				alert("제목을 입력하세요.");
				$("#subject").focus();
				return false;
			}
			if($.trim($("#content").val()) == ""){
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
			
			console.log($.trim($("#content").val()).length);
			if($.trim($("#content").val()).length > 200){
				alert("내용은 200자 이내로 입력하세요");
				$("#content").focus();
				return false;
			}
			return false;
		});		
	});	