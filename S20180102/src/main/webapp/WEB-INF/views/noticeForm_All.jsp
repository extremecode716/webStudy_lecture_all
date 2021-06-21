<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.page-item {
		float:left;
	}
</style>
</head>

<body>

<div class="container">
	<center>
		<h1 style="margin-top:50px; margin-bottom: 60px">NOTICE</h1>
	</center>
	<c:set var="num" value="${pg.total-pg.start+1}"/> 
		<table class="table table-hover" style="text-align: center">
			<tr>
				<th width="80px">번호</th>
				<th>제목</th>
				<th width="80px">조회수</th>
				<th width="200px">작성일</th>
			</tr>
			<tr style="height: 15px">
				<td>*</td>
				<td><a href="getNotice.do?noticeNo=1" style="color: gray"><small>[당첨자발표]창사 1주년 2017년 겨울 여행 후기 이벤트 안내</small></a></td>
				<td>-</td>
				<td>2018-01-02</td>
			</tr>
			<tr>
				<td>*</td>
				<td><a href="getNotice.do?noticeNo=2" style="color: gray"><small>채팅상담 서비스 안내</small></a></td>
				<td>-</td>
				<td>2018-02-02</td>
			</tr>
			<tr>
				<td>*</td>
				<td><a href="getNotice.do?noticeNo=3" style="color: gray"><small>2017년 개인정보 이용내역 통지안내</small></a></td>
				<td>-</td>
				<td>2018-01-07</td>
			</tr>
			<tr>
				<td>*</td>
				<td><a href="getNotice.do?noticeNo=4" style="color: gray"><small>[당첨자발표]창사 6개월 2017년 여름여행 후기 이벤트 안내</small></a></td>
				<td>-</td>
				<td>2017-05-18</td>
			</tr>
			<tr>
				<td>*</td>
				<td><a href="getNotice.do?noticeNo=5" style="color: gray"><small>카카오 알림톡 안내</small></a></td>
				<td>-</td>
				<td>2017-12-21</td>
			</tr>
			<tr>
				<td>*</td>
				<td><a href="getNotice.do?noticeNo=6" style="color: gray"><small>[안내]설 연휴 특집 이벤트</small></a></td>
				<td>-</td>
				<td>2018-02-06</td>
			</tr>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${num}</td>
					<td><a href="noticeDetail.do?noticeNo=${notice.noticeNo}">${notice.ntitle}</a></td>
					<td>${notice.nreadCount}</td>
					<td>${notice.ncredate}</td>
				</tr>
				<c:set var="num" value="${num-1}" />
			</c:forEach>
		</table>
	
	
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="notice.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="notice.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="notice.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
	
</div>
<div style="clear: both; height: 100px">
</div>	

	 <jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>