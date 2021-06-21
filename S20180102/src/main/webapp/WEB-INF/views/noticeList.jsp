<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.page-item {
		float:left;
	}
	
	#writeNotice {
		padding: 10px 15px; 
		border: 1px solid rgb(61,183,204);
		color: rgb(61,183,204);
	}
	
	#writeNotice:hover {
		text-decoration: none;
		background-color: rgb(61,183,204);
		color: white;
	}
</style>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		<h2>공지사항</h2>
		<br>
		<hr>	
	</div>
</center>
		<a id="writeNotice" href="writeNoticeForm.do">공지사항 등록</a>
<center>
		<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<table class="table table-hover" style="text-align: center">
		<caption style="caption-side: top; font-size: 13px">공지글을 클릭하시면 수정 및 삭제가 가능합니다.*</caption>
			<tr>
				<th width="120px">게시물번호</th>
				<th>제목</th>
				<th width="100px">조회수</th>
				<th width="150px">등록일</th>
			</tr>
			<c:if test="${total > 0 }">
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.noticeNo }</td>
						<td><a href="selNoticeDetail.do?noticeNo=${list.noticeNo}">${list.ntitle }</a></td>
						<td>${list.nreadCount }</td>
						<td>${list.ncredate }</td>
					</tr>
					<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>
			</c:if>
			<c:if test="${total ==0 }">
				<tr>
					<td colspan=6>작성한 공지사항이 없습니다 :-)</td>
				</tr>
			</c:if>
		</table>

		<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="noticeList.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="noticeList.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="noticeList.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
</center>
</div>
</body>
</html>