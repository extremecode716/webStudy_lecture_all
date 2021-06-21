<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div style="margin-top: 30px; text-align:center; margin-bottom: 50px">
		<h2>공지</h2>
		<hr>
	</div>
	<form action="upNoticePro.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${nDto.noticeNo }">
		<table style="width: 60%; margin: auto">
			<tr>
				<th colspan="2">공지제목</th>
			</tr>
			<tr>
				<td colspan="2">
				<input type="text" class="form-control" value="${nDto.ntitle }" name="ntitle" required="required">
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
				<pre>
					<textarea name="ncontent" class="form-control"  cols="40" rows="13" placeholder="내용...">${nDto.ncontent }</textarea>
				</pre>
				</td>
			</tr>
		</table>
		<div style="width: 60%; margin: auto; text-align: center"> 
					<input class="btn btn-info" style="margin-top: 30px; display:inline-block; width: 45%" type="submit" value="수정">
					<input class="btn btn-info" style="margin-top: 30px; display:inline-block; width: 45%" 
						   type="button" onclick="location.href='delNotice.do?noticeNo=${nDto.noticeNo}'" value="삭제">
		</div>
	</form>
</div>
</body>
</html>