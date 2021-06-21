<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td {
		padding: 10px;
	}

</style>
</head>
<body>
<div class="container">
<div style="margin-top: 100px">
	<table  class="table" style="width: 60%; border:1px solid lightgray; margin: auto">
		<tr>
			<td rowspan="2" style="text-align: center; width: 100px">No. ${noticeDto.noticeNo}</td>
			<td colspan="2">${noticeDto.ntitle}</td>
		</tr>
		<tr>
			<td style="text-align: right;">
			<span style="font-size: 13px; margin-right: 5px">
				<b>written by</b>
			</span> 
			관리자
			</td>
			<td width="100px" style="text-align: center">조회수  ${noticeDto.nreadCount}</td>
		</tr>
		<c:if test="${noticeDto.nimg !=null }">
			<tr>
				<td colspan="3" style="text-align: right">
				첨부파일
				<img src="${pageContext.request.contextPath}/items/file.png" style="margin-top: -10px; margin-left: -10px; width: 40px; height: 34px">
				<br> 
				<a href="download.do?filename=${noticeDto.nimg }">
					<small>${noticeDto.nimg }</small>
				</a>
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="3">
			<pre>${noticeDto.ncontent}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="3">${noticeDto.ncredate}</td>
		</tr>
	</table>

</div>
</div>
<div style="clear: both; height: 130px;">
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>