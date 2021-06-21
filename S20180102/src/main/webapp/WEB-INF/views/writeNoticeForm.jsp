<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div style="margin-top: 30px; text-align:center; margin-bottom: 50px">
		<h2>공지 등록</h2>
		<hr>
	</div>
	<form action="writeNoticePro.do" method="post" enctype="multipart/form-data">
		<table style="width: 60%; margin: auto">
			<tr>
				<th colspan="2">공지제목</th>
			</tr>
			<tr>
				<td colspan="2">
				<input type="text" class="form-control" name="ntitle" required="required">
				</td>
			</tr>
			<tr>
				<th width="50%"></th>
				<th style="padding: 5px 0px"><small>＃ 첨부파일</small></th>
			</tr>
			<tr>
				<td width="50%"></td>
				<td style="text-align: right"><input type="file" name="files">
				</td>
			</tr>
			<tr>
				<th colspan="2">공지내용</th>
			</tr>
			<tr>
				<td colspan="2">
				<textarea name="ncontent" class="form-control"  cols="40" rows="13" placeholder="내용..."></textarea> </td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="btn btn-info btn-block" style="margin-top: 30px;" type="submit" value="확인">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>