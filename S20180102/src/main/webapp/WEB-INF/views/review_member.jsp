<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	.btn-info {
		padding: 5px 10px
	}
	
	th {
		text-align: center;
	}
	a:hover {
		text-decoration: none;
	}
	.page-item {
		float:left;
	}
	
</style>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>

<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		<h2>REVIEW</h2>
		<br>
		<hr>	
	</div>
<c:set var="num" value="${pg.total-pg.start+1}"></c:set>

<table style="width: 80%" class="table">
	<caption style="caption-side: top; font-size: 12px;">
		* 예약 페이지에서 투어완료하거나, 투어일 경과 3일 후에 후기 작성이 가능합니다. 
		<a href="reservation_member.do" style="color: red"> ● 투어 완료하러가기</a> 
	</caption>
	<c:if test="${total > 0 }">
	<tr><th width="10%">주문번호</th>
		<th width="40%">상품명</th>
		<th width="15%">투어일자</th>
		<th colspan=3 width="35%">후기</th>
	</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.payCode }</td>
				<td><a href="tour_detail.do?gservNo=${list.gservNo }"
					   style="font-size: 16px;">
					${list.gservTitle }</a>
				</td>
				<td>${list.tourDate }</td>
					<c:if test="${list.rvNum >0 }">
						<c:if test="${list.openReview > 0 }">
							<td width="10%"><input type="button" value="후기닫기" class="btn" onclick="location.href='review_member.do?currentPage=${currentPage }'"></td>
						</c:if>
						<c:if test="${list.openReview == 0 }">
							<td width="10%"><input type="button" value="후기보기" class="btn" onclick="location.href='getReviewPro.do?gservNo=${list.gservNo}&rn=${list.rn }&payCode=${list.payCode }'"></td>
						</c:if>
						<td width="10%"><input type="button" value="후기수정" class="btn" onclick="location.href='upReviewForm.do?gservNo=${list.gservNo}&payCode=${list.payCode }'"></td>
						<td width="15%"><input type="button" value="후기삭제" class="btn" onclick="location.href='delReviewPro.do?gservNo=${list.gservNo}&payCode=${list.payCode }'"></td>
					</c:if>
					<c:if test="${list.rvNum == 0 }">
						<td>
						  <input type="button" value="후기작성" class="btn " onclick="location.href='inReviewForm.do?payCode=${list.payCode}'">
						</td>
					</c:if>
				</tr>
			<form action="inCmtPro.do">
				<input type="hidden" name="gservNo" value="${revDto.gservNo }">
				<input type="hidden" name="rgroup" value="${revDto.rgroup }"> 
				<input type="hidden" name="nickName" value="${revDto.nickName }"> 
				<input type="hidden" name="payCode" value="${revDto.payCode }"> 
				<input type="hidden" name="rn" value="${list.rn }"> 
				<c:if test="${list.openReview > 0}">
					<tr>
						<td rowspan=3><img class ="rImg" src="${pageContext.request.contextPath}/images/${revDto.rimg }" onerror="this.src='${pageContext.request.contextPath}/items/review_alt.png'"></td>
						<td colspan=4>${revDto.rtitle }</td>
						<td><strong style="color: #3DB7CC">DATE</strong><br> ${revDto.rcredate }</td>
						
					</tr>
					<tr>
						<td  rowspan=2, colspan=4><pre>${revDto.rcontent }</pre></td>
						<td><strong style="color: #3DB7CC">STAR</strong> <c:forEach var="i" begin="1" end="${revDto.rstar }">★</c:forEach> </td>
					</tr>
					<tr>
						<td><strong style="color: #3DB7CC">BY</strong><br> ${revDto.nickName }</td>
					</tr>
					<c:forEach var="revList" items="${revList }">
						<tr>
							<td>┗</td>
							<td colspan=2>${revList.rcontent }</td>
							<td width="10%"><strong style="color: #3DB7CC">DATE</strong><br></b> ${revList.rcredate }</td>
							<td><strong style="color: #3DB7CC">BY</strong><br> ${revList.nickName }</td>
							<c:if test="${revDto.memberId==revList.memberId }">
								<td>
									<a href='delCmtPro.do?gservNo=${revDto.gservNo}&rstep=${revList.rstep}&rn=${list.rn }&payCode=${revList.payCode }'">
										<img style="width: 20px;" src="${pageContext.request.contextPath}/items/cancel1.png">			
									</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
						<tr>
							<td>┗</td>
							<td colspan=3><textarea class="form-control" name="rcontent" cols="80"></textarea></td>
							<td><input type="submit" class="btn" value="comment"></td>
						</tr>					
				</c:if>
			</form>
			<c:set var="num" value="${num - 1 }"></c:set>
		</c:forEach>
	</c:if>			
				
	<c:if test="${total ==0 }">
			<tr>
				<td colspan=6 style="text-align: center">작성할 후기가 없습니다 :-)</td>
			</tr>
		</c:if>
</table>

</center>
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="review_member.do?currentPage=${pg.startPage-pg.pageBlock}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="review_member.do?currentPage=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="review_member.do?currentPage=${pg.startPage+pg.pageBlock}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
</div>
</body>
</html>