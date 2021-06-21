$(document).ready(function() {
		$("form").submit(function() {
			if ($("#writer").val() == "") {
				alert("작성자명을 입력하세요");
				$("#writer").focus();
				return false;
			}
			if ($("#subject").val() == "") {
				alert("제목을 입력하세요");
				$("#subject").focus();
				return false;
			}
			if ($("#content").val() == "") {
				alert("내용을 입력하세요");
				$("#content").focus();
				return false;
			}
		});
	});