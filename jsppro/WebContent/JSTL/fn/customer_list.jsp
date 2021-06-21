<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<jsp:include page="../top_include.jsp"/>
</head>

<body>
	<!-- 게시판 리스트 -->
	<div id="cuslist_wrap" align="center">

		<%-- <h2 class="cuslist_title">고객센터</h2>
		<div id="cuslist_c">글 개수 : ${listcount}</div> --%>

		<table id="cuslist_t" align="center" border="1" width="550"
		class="table table-striped" style="width:65%; margin:auto;">
			<tr>
				<th colspan="5"> 고객센터- 글 개수 : ${listcount}</th>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>날짜</th>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="b" items="${boardlist}">
			
			<tr>
				<td align="center" width="10%">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td align="left" width="50%">						
					<%-- 	
					<c:if test="${b.board_re_lev != 0}"> 
						<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
						<img src="./images/AnswerLine.gif">	
					</c:if>					
						 --%>
					<!-- 제목 출력 부분 -->	
					<a href="customer_cont.pix?customer_no=${b.customer_no}&page=${page}&state=cont">
							${b.customer_name}
					</a>
				</td>

				<td align="center" width="15%">${b.member_id}</td>
				<td align="center" width="10%">${b.customer_count}</td>
				<td align="center" width="15%">${fn:substring(b.rec_date,0,10)}</td>
				<%-- <td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${b.board_readcount}</div>
				</td> --%>
			</tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->	
			
			<tr>
				<td colspan="5" align="center">
				
				<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="customer_list.pix?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="customer_list.pix?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="customer_list.pix?page=${page+1}">[다음]</a>
			</c:if>	
					
					
					</td>
			</tr>
			<c:if test="${member_type == 'member'}">
			<tr>
				<th colspan="5" align="right">
				<input type="button" value="글쓰기" class="input_button"
				onclick="location='customer_write.pix?page=${page}'"></th>
			</tr>
			</c:if>		
		</table>
		

		<%-- <div id="cuslist_paging">			
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="customer_list.pix?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="customer_list.pix?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="customer_list.pix?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
		<div id="cuslist_w">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location='customer_write.pix?page=${page}'">
		</div> --%>
		
	</div>
	
		<!--footer include!  -->
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>