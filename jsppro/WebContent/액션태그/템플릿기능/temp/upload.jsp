<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
	<head><title>자료실 폼</title>
	</head>
	<body>
	<center><h1>자 료 실</h1></center>
	<table border=1 align=center width=600>
	<form name=myform method=post action=upload.jsp>
		<tr><td>글쓴이</td>
			<td><input type=text></td>
		</tr>
		<tr><td>이메일</td>
			<td><input type=text></td>
		</tr>
		<tr><td>비밀번호</td>
			<td><input type=password></td>
		</tr>
		<tr><td>제목</td>
			<td><input type=text size=50></td>
		</tr>
		<tr><td>내용</td>
			<td><textarea rows=10 cols=55>
				</textarea></td>
		</tr>
		<tr><td>파일첨부</td>
			<td>
			<input type=file 
				name=myfile1><br>
			<input type=file				name=myfile2></td>
		</tr>
		<tr><td colspan=2 align=center>
			<input type=submit value="글작성">
			<input type=reset value="다시작성"></td>
		</tr>
	</form>
	</table>
	</body>
</html>