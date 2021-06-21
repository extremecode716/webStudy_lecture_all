<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#list').load('list.do?pageNum=${pageNum}');
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
		
		<a href="list.do?pageNum=${pageNum}" class="btn btn-info">목록</a> 
		<a href="updateForm.do?num=${board.num}&pageNum=${pageNum}"
		   class="btn btn-info">수정</a> 
		<a href="deleteForm.do?num=${board.num}&pageNum=${pageNum}"
		   class="btn btn-info">삭제</a> 
		<a href="insertForm.do?nm=${board.num}&pageNum=${pageNum}"
		   class="btn btn-info">답변</a>
		<div id="list"></div>
	</div>
</body>
</html>