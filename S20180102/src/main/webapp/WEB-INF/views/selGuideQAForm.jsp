<%@page import="oracle.java.s20180102.model.QADto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
<!-- ajax 경로 설정 -->
<%String context = request.getContextPath();%>
	
	//수정하기1
	function corrClick(num1,num2){
		var qaNumber = num1;
		var qaStep = num2; 
		var tdClass = "."+num1+"class"+num2;
		
		var dataIn = {};
		dataIn = {
				qaNumber : qaNumber,
				qaStep : qaStep,
		}
		
		//제목과 내용란을 text로 비워준다
		if(dataIn !=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/corrQA.do',
				data : dataIn,
				success : function(data){ 
					//수정할 칸을 만들어준다
					if(data < 1){
						$(tdClass).empty(); //기존의 내용 지움
						$(tdClass).append("<textarea rows='3' cols='70' class='form-control' id='"+qaNumber+"Send"+qaStep+"' value='수정할 내용을 입력하세요'>");
						$(tdClass).append("<br><input type='button' onclick='corrClick2("+qaNumber+","+qaStep+")' class='btn' style='float : right' value='수정'>");
					}
				}
			});
		}
	}
	//수정하기2
	function corrClick2(num1,num2){
		var qaNumber = num1;
		var qaStep = num2; 
		var id = "#"+qaNumber+"Send"+qaStep; //textarea의 id
		var tdClass = "."+num1+"class"+num2; //새로 들어온 것을 위치시켜줘야하니까..class
		
		var qaContent = $(id).val(); //내용
		
		//제목과 내용을 받아가서 update한다
		var dataIn2 = {};
		dataIn2 = {
				qaNumber : qaNumber,
				qaStep : qaStep,
				qaContent : qaContent,
		}
		
		if(dataIn2 !=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/corrQA.do',
				data : dataIn2,
				success : function(data){ 
					/* alert("보냈어!"); */
					//수정할 칸을 만들어준다
					if(data > 0){
						alert("수정 완료!");
						/* window.location.reload(true); */ 
						$(tdClass).empty(); //기존의 내용 지움
						$(tdClass).append("[수정완료]"+qaContent); //바뀐 내용 보여준다
						$(tdClass).append("<input type='button' id='corr' onclick='corrClick("+qaNumber+","+qaStep+")' value='수정'>");
						$(tdClass).append("<input type='button' id='del' onclick='delClick("+qaNumber+","+qaStep+")' value='삭제'>");
					}
				}
			});
		}
		
	}
	//삭제하기
	function delClick(num1,num2){
		var qaNumber = num1;
		var qaStep = num2; 
		var tdClass = "."+num1+"class"+num2; //새로 들어온 것을 위치시켜줘야하니까..class
		
		//ajax
		//VO형식의 parameter
		var dataIn = {};
		dataIn = {
				qaNumber : qaNumber,
				qaStep : qaStep,
		}
		
		//받아간 것을 가져가서.. 삭제합니다 
		if(dataIn !=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/delQA.do',
				data : dataIn,
				success : function(data){ //
					$(tdClass).empty(); //기존의 내용 지움
					$(tdClass).append("삭제되었습니다"); 
				}
			});
		}
	}
	
	// 답변달기 등록
	function inReply(id) {
		var id_rpy = id; //qaNumber
		var id_content = '#'+id_rpy+'inReply'; 
		var con = $(id_content).val(); //qacontent
		var id_memberId = '#'+id_rpy+'memberId'; 
		var mem = $(id_memberId).val(); //memberId -> receiverId로 저장
		var id_gservNo = '#'+id_rpy+'gservNo';
		var gservNo = $(id_gservNo).val(); //gServNo
		var id_receiver = '#'+id_rpy+'qaReceiver';
		var rec = $(id_receiver).val(); //문의를 받았던 receiver -> 답변 작성 memerber
		var tbId = '#'+id_rpy+'addRow'; //tbody의 Id

		
		//qaDto에 넣을 변수들
		var send_qaNumber = id_rpy;
		var send_qaContent = con;
		var send_qaReceiver = mem; 
		var send_gservNo = gservNo;
		var send_memberId = rec; 
					
		$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
		
		//VO형식의 parameter
		var dataIn ={};
		dataIn = {
				qaNumber : send_qaNumber,
				qaContent : send_qaContent,
				qaReceiver : send_qaReceiver,
				gservNo : send_gservNo,
				memberId : send_memberId,
		}
				
		if(id_rpy!=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/writeQA.do',
				data : dataIn,
				success : function(data){
					if (data == null || data == '') {
						data = 0;
					}
						$(tbId).append( "<tr><td></td>"  
												+ "<td colspan='3' style='text-align:left; padding-left: 20px'>"
												+ "<img src='${pageContext.request.contextPath}/items/RE.PNG' style='width: 30px'><br>"
												+ data['qaContent']
												+ "<br><br>"
												+ "</td>" //미정
												+ "<td>"
												+ data['memberId']
												+ "</td>"
												+ data['qaCredate']+"</tr>");
				}
			});
		}
		
		
		<%-- if(id_rpy!=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/writeQA_guide.do',
											data : {send_qaNumber : send_qaNumber, send_qacontent:send_qacontent,send_qareceiver:send_qareceiver,send_gServNo:send_gServNo,send_memberId:send_memberId},
											dataType : 'json',
											error : function() {
												console.log("error");
											},
											success : function(data) {
												if (data == null || data == '') {
													data = 0;
												}
													$(tbId).append( "<tr><td></td>"  
																			+ "<td>└ [답변] "
																			+ data['qaContent']
																			+ "</td>"
																			+ "<td></td><td>"
																			+ data['qaComplete']
																			+ "</td>" //미정
																			+ "<td>"
																			+ data['memberId']
																			+ "</td>"
																			+ data['qaCredate']+"</tr>");
													
											}
											
										});
		} --%>
	}
	
	// hide&show 수행
	$(function() {
		var check = 0;
		
		$('.qaTitleBtn').click(function(){ //class 이름 : qaTitleBtn
		/* $('input').on('click', function(e) { */
			/* var id = e.target.getAttribute('id'); //id="${qa.qaNumber}" */
			
			var id = this.id;  //id="${qa.qaNumber}"
			
			if ((id != '') && (id != null)) {
				console.log(id);
			}
			//여기까지: id 받아오기 완료

			/* if(id == "diff"){alert("diff");} */
			if (id != "diff") {
				var data = id;
				console.log("qaNumber는 " + data);

				//hide를 해보자
				var liid = "#" + data + "lili";
				var liid2 = "#" + data + "lilili";
				var liid3 = "#" + data + "lililili";
				var liid4 = "#" + data + "rpy";
				$(liid).toggle(); //liid로 시작하는 아이디 모두 hide
				//현실과 타협 >> 좀있다 고치기
				$(liid + "1").toggle();
				$(liid + "2").toggle();
				$(liid + "3").toggle();
				$(liid + "4").toggle();
				$(liid + "5").toggle();

				$(liid2 + "1").toggle();
				$(liid2 + "2").toggle();
				$(liid2 + "3").toggle();
				$(liid2 + "4").toggle();
				$(liid2 + "5").toggle();

				$(liid3 + "1").toggle();
				$(liid3 + "2").toggle();
				$(liid3 + "3").toggle();
				$(liid3 + "4").toggle();
				$(liid3 + "5").toggle();

				$(liid4).toggle();
			}
		});
	});
</script>

<style type="text/css">
 #qaTitleBtn {
 	text-align: left;
 	padding-left: 20px;
 }
 th {
	background-color: rgb(61, 183, 204);
	color: white;
	padding: 5px;
}
td {
	word-break: break-all; /* 텍스트에 따라 폭 변하지 않게 */
}
td.tdContent {
	padding : 5px;
}
#qaTitleBtn:hover {
	cursor: pointer;
	font-weight: bold;
	background-color: #EAEAEA;
}
.tdTitle {
	text-align: left;
}
.divCon {
	padding: 30px;
	text-align: left;
}
.divCon1 {
	padding: 20px;
	text-align: left;
}
.page-item {
		float:left;
	}
.btn {
	padding: 0px 10px;
	margin-left: 10px;
}
.btn-block {
	margin: 10px 0px;
}
</style>
</head>
<body>
	<!-- 사용가능한 변수
	: pg, ID, gServList, qaGuideList -->

	<jsp:include page="guideBar.jsp"></jsp:include>
<div class="container">
<center>
	<div style="margin-top: 50px; margin-bottom:50px">
		<h2>Q&A</h2>
		<br>
		<hr>	
	</div>
	<c:set var="num" value="${pg.total-pg.start+1}" />
	<form action="selGuideQAPro.do">
		<select name="qAreply">
			<!-- 전체일 경우, 아무것도 설정 안하는 것이랑 동일하게 하기위해 null로 지정 -->
			<option value="a" selected="selected">전체 보기</option>
			<option value="y">답변완료</option>
			<option value="n">답변미완료</option>
		</select> <select name="gservTitle">
			<option value="a">전체보기</option>
			<c:forEach var="gSTitle" items="${gservList}">
				<!-- 존재하는 gService 전부 호출 -->
				<option value="${gSTitle.gservTitle}">${gSTitle.gservTitle}</option>
			</c:forEach>
		</select> <input type="submit" class="btn" value="필터적용">
	</form>

	<table style="width: 100%; text-align: center">
		<tr>
			<th width="100px">번호</th>
			<th width="100px">상품번호</th>
			<th>문의글</th>
			<th width="150px">답변상태</th>
			<th width="150px">작성자</th>
			<th width="150px">작성일</th>
		</tr>


		<c:forEach var="qa" items="${qaGuideList}">
			<input type="hidden" id="${qa.qaNumber}gservNo" value="${qa.gservNo}">
			<c:set var="userID" value="${ID}" />
			<c:set var="receiverID" value="${qa.qaReceiver}" />
			<c:set var="qaNumber" value="${qa.qaNumber}" />
			<!-- 로그인한 아이디=문의받는사람, qastep=0인 경우가 ★기본 문의★ -->
			<tr>
				<td><input type="hidden" id="${qa.qaNumber}qaReceiver" value="${qa.qaReceiver}">${num}</td>
				<td><a href="tour_detail.do?gservNo=${qa.gservNo}">${qa.gservNo}</a></td>
				<td id="qaTitleBtn">
				<span class="qaTitleBtn" id="${qa.qaNumber}">${qa.qaTitle}</span>
				</td>
				<c:if test="${qa.qaComplete=='n'}">
					<td style="color:blue">미완료</td>
				</c:if>
				<c:if test="${qa.qaComplete=='y'}">
					<td style="color:red">답변완료</td>
				</c:if>
				<td><input type="hidden" id="${qa.qaNumber}memberId" value="${qa.memberId}">${qa.memberId}</td>
				<td>${qa.qaCredate}</td>
				
			</tr>
			<tr>
				<td></td>
				<td id="${qa.qaNumber}lili" class="divCon" colspan="3" style="display: none">
					${qa.qaContent}</td>
				<td></td>
				<td></td>
			</tr>
			<c:set var="num" value="${num-1}" />
			<!-- 높은숫자부터 차례로 낮아짐 -->

			<!-- 해당 ★기본 문의★의 답변내용 -->
			<c:forEach var="qa_rpy" items="${qaGuideList_rpy}">
				<c:set var="userID2_rpy" value="${qa_rpy.memberId}" />
				<c:set var="qaNumber_rpy" value="${qa_rpy.qaNumber}" />
				<c:set var="myId" value="${ID}"/>
				<c:if test="${qaNumber_rpy eq qaNumber}">
					<tr>
						<td></td>
						<td id="${qa_rpy.qaNumber}lili${qa_rpy.qaStep}" class="${qa_rpy.qaNumber}class${qa_rpy.qaStep}  divCon1"
							style="display: none" colspan="3">
							<img src="${pageContext.request.contextPath}/items/RE.PNG" style="width: 30px">
							<br>${qa_rpy.qaContent}<br><br>
							<c:if test="${userID2_rpy eq myId}">
								<input type="button" style="float:right" class="btn" onclick="delClick(${qa_rpy.qaNumber},${qa_rpy.qaStep})" value="삭제">
								<input type="button" style="float:right" class="btn" onclick="corrClick(${qa_rpy.qaNumber},${qa_rpy.qaStep})" value="수정">
							</c:if>
						</td>
						<td id="${qa_rpy.qaNumber}lilili${qa_rpy.qaStep}"
							style="display: none">${qa_rpy.memberId}</td>
						<td id="${qa_rpy.qaNumber}lililili${qa_rpy.qaStep}"
							style="display: none">${qa_rpy.qaCredate}</td>
					</tr>
				</c:if>
			</c:forEach>
			<tbody id="${qa.qaNumber}addRow" style="position: relative;"></tbody>
			<tr>
				<td></td>
				<td id="${qa.qaNumber}rpy" style="display: none" colspan="3">
				<textarea id="${qa.qaNumber}inReply" rows="10" cols="100"></textarea>
				<input type="button" id="diff" onclick="inReply(${qa.qaNumber});" class="btn btn-info btn-block" value="답변달기">
				</td>
			</tr>
		</c:forEach>

	</table>
	
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="selGuideQAPro.do?currentPage=${pg.startPage-pg.pageBlock }&qAreply=${qAreply}&gServTitle=${gservTitle}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="selGuideQAPro.do?currentPage=${i}&qAreply=${qAreply}&gservTitle=${gservTitle}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="selGuideQAPro.do?currentPage=${pg.startPage+pg.pageBlock }&qAreply=${qAreply}&gServTitle=${gservTitle}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
</center>
</div>
</body>
</html>