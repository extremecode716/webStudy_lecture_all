$(document).ready(function(){
		$("form").submit(function(){
			
			if($.trim($("#id").val())==""){
				alert("ID를 입력하세요.");
				$("#id").focus();
				return false;
			}
			
			if($.trim($("#passwd").val())==""){
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return false;
			}
			
		});
});	