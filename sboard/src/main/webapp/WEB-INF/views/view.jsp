<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 	window.onload=function() {
	
	 } */
	$(function() {
		$('#slist').load('${path}/slist/num/${board.num}');
//		$('#list').load('${path}/list/pageNum/${pageNum}');
		$('#repInsert').click(function() {
			if (!frm.replytext.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.replytext.focus();
				return false;
			}
			var frmData = $('form').serialize();
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;				  
			$.post('${path}/sInsert', frmData, function(data) {
				$('#slist').html(data);
				frm.replytext.value = '';
			});
		});
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<td>제목</td>
				<td>${board.subject}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board.readcount}</td>
			</tr>
			<tr>
				<td>아이피</td>
				<td>${board.ip}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${board.email}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>${board.content}</pre></td>
			</tr>
		</table>
		<a href="${path}/list/pageNum/${pageNum}" class="btn btn-info">목록</a>
		<a href="${path}/updateForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-info">수정</a> <a
			href="${path}/deleteForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-info">삭제</a> <a
			href="${path}/insertForm/nm/${board.num}/pageNum/${pageNum}"
			class="btn btn-info">답변</a>
		<p>
		<form name="frm" id="frm">
			<input type="hidden" name="replyer" value="${board.writer}">
			<input type="hidden" name="bno" value="${board.num}"> 댓글 :
			<textarea rows="3" cols="50" name="replytext"></textarea>
			<input type="button" value="확인" id="repInsert">
		</form>
		<div id="slist"></div>
		<!-- <div id="list"></div> -->
	</div>
</body>
</html>