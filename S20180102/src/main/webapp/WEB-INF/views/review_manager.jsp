<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rImg {
	width: 70px;
	height: 70px;
	border-radius: 0.5em;
}

#show:hover {
	cursor: pointer;
	color: rgb(61,183,204);
}
.btn {
	padding: 2px 20px;
}
.page-item {
	float:left;
}

</style>
<script type="text/javascript">
	function showContent(payCode) {
		var id = "#"+payCode;
		$(id).toggle();
	}
	
	function chk() {
		if(confirm("정말 이 후기글을 삭제하시겠습니까?\n삭제하시면 복구되지 않습니다.")){
			return true;
		} else {return false;}	
	}
</script>
</head>
<body>
	<jsp:include page="managerBar.jsp"></jsp:include>
	<div class="container" style="margin-top: 60px">
		<form action="review_manager.do">
			<input type="text" name="searchKey" class="form-control" style="width: 300px; display: inline-block;" placeholder="상품명을 검색하세요!">
			<input type="submit" class="btn btn-info" value="검색">
		</form>
		<table class="table table-hover" style="text-align: center">
			<caption style="caption-side: top"><small>후기명을 클릭하시면 후기글을 보실 수 있습니다.*</small></caption>
			<tr>
				<th>상품명</th>
				<th>TITLE</th>
				<th width="100px">닉네임</th>
				<th width="60px">평점</th>
				<th width="120px">작성일자</th>
				<th width="120px">삭제</th>
			</tr>
				<c:forEach var="list" items="${list }">

					<tr>
						<td>${list.gservTitle }</td>
						<td><span id="show" onclick="showContent('${list.payCode}')">${list.rtitle }</span></td>
						<td>${list.nickName }</td>
						<td>${list.rstar }</td>
						<td>${list.rcredate }</td>
						<td>
						<form action="delReviewM.do" method="post" onsubmit="return chk()" style="margin: 0px">
							<input type="hidden" name="rgroup"  value="${list.rgroup }">
							<input type="hidden" name="gservNo"  value="${list.gservNo }">
							<input type="hidden" name="payCode" value="${list.payCode }">
							<c:if test="${searchKey != null }">
							<input type="hidden" name="searchKey" value="${searchKey }">							
							</c:if>
							<input type="submit" class="btn" value="후기삭제">
						</form>
						</td>
						
					</tr>
					<tr id="${list.payCode}" style="display: none; text-align: left">
						<td colspan="6"><pre style="padding-left: 60px;">${list.rcontent }</pre></td>
					</tr>
				</c:forEach>
		</table>
		<c:if test="${pg != '1' }">
			<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
				  <ul style="display: inline-block; padding: 0px; margin: auto;">
					<c:if test="${pg.startPage > pg.pageBlock }">
						<li class="page-item"><a class="page-link" href="review_manager.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
					</c:if>
					<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
						<li class="page-item"><a class="page-link" href="review_manager.do?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pg.endPage < pg.totalPage }">
						<li class="page-item"><a class="page-link" href="review_manager.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
					</c:if>
				  </ul>
			</div>
		</c:if>
	</div>
</body>
</html>