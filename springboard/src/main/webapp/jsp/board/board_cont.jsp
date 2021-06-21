<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시판 내용보기</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css" />
</head>

<body>
	<div id="boardcont_wrap">
		<h2 class="boardcont_title">게시물 내용보기</h2>
		<table id="boardcont_t">
			<tr>
				<th>제목</th>
				<td>${bcont.board_subject}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td>
					<%--  ${board_cont} --%> 
					<pre>${bcont.board_content}</pre>
				</td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${bcont.board_readcount}</td>
			</tr>
		</table>

		<div id="boardcont_menu">
			<input type="button" value="수정" class="input_button"
				onclick="location='board_cont.do?board_num=${bcont.board_num}&page=${page}&state=edit'" />
			<input type="button" value="삭제" class="input_button"
				onclick="location='board_cont.do?board_num=${bcont.board_num}&page=${page}&state=del'" />
			<input type="button" value="답변" class="input_button"
				onclick="location='board_cont.do?board_num=${bcont.board_num}&page=${page}&state=reply'" />
			<input type="button" value="목록" class="input_button"
				onclick="location='board_list.do?page=${page}'" />
		</div>
	</div>
</body>
</html>