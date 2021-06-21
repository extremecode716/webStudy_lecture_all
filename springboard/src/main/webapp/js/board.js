function board_check() {
	if ($.trim($("#board_name").val()) == "") {
		alert("글쓴이를 입력하세요!");
		$("#board_name").val("").focus();
		return false;
	}
	if ($.trim($("#board_pass").val()) == "") {
		alert("비밀번호를 입력하세요!");
		$("#board_pass").val("").focus();
		return false;
	}
	if ($.trim($("#board_subject").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#board_subject").val("").focus();
		return false;
	}
	if ($.trim($("#board_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#board_content").val("").focus();
		return false;
	}
}