<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>FileUpload Form</title>
</head>
<body>
	<center>
		<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
			<table border=1>
				<tr>
					<td colspan=2 align=center>
						<h3>파일 업로드 폼</h3>
					</td>
				<tr>
					<td>올린 사람 :</td>
					<td>
						<input type="text" name="name">
					</td>
					<br>
				</tr>
				<tr>
					<td>제목 :</td>
					<td>
						<input type="text" name="subject">
					</td>
					<br>
				</tr>
				<tr>
					<td>파일명1 :</td>
					<td>
						<input type="file" name="fileName1">
					</td>
					<br>
				</tr>
				<tr>
					<td>파일명2 :</td>
					<td>
						<input type="file" name="fileName2">
					</td>
					<p />
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="submit" value="전송">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
