<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- ajax쓰려고 가져옴 -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- style -->
<style type="text/css">
.btn {
	padding: 0px 10px;
}
<!-- 가져온 버튼-->
input{
  background:blue;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}

input:before,input:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
input:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
input:hover:before,input:hover:after{
  width:100%;
  transition:800ms ease all;
}
<!-- 여기까지 :D -->

table {
	width: 100%;
	/* table-layout:fixed; */
	margin : 2px;
	padding : 2px;
}
th {
	background-color: rgb(61, 183, 204);
	color: white;
	padding: 5px;
}
td {
	word-break: break-all; /* 텍스트에 따라 폭 변하지 않게 */
	padding: 2px;
}

td.tdContent {
	padding : 5px;
}
td.tdTitle:hover {
	cursor: pointer;
	font-weight: bold;
	background-color: #EAEAEA;
}
.tdTitle {
	text-align: left;
}
.divCon {
	padding: 20px;
	text-align: left;
}
.divCon1 {
	padding: 10px;
	text-align: left;
	max-width: 600px;
}
pre{
    padding:10px;
    overflow: auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */
}   

.page-item {
		float:left;
	}
</style>

<script type="text/javascript">
<!-- ajax 경로 설정 -->
<%String context = request.getContextPath();%>

	//수정하기1, parameter = ${qa.qaNumber}
	function corrClick(num){
		var qaNumber = num;
		var qaStep = 0; //member가 자신의 글을 수정함
		var id = '#'+qaNumber+"con"; //span [내용]의 id
		//ajax
		//VO형식의 parameter
		var dataIn = {};
		dataIn = {
				qaNumber : qaNumber,
				qaStep : qaStep,
				//바뀌는 내용의 qaContent도 가져가야합니다.. 그러려면 버튼 누른뒤 -> ajax1로 칸을 만들어줘야겠지요
		}
		
		//제목과 내용란을 text로 비워준다
		if(dataIn !=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/corrQA.do',
				data : dataIn,
				success : function(data){ 
					/* alert("되돌아옴"); */
					//수정할 칸을 만들어준다
					if(data < 1){
						$(id).empty(); //기존의 내용 지움
						$(id).append("<textarea rows='3' cols='70'class='form-control' id="+qaNumber+"Send value='수정할 내용을 입력하세요'>");
						$(id).append("<br><input type='button' onclick='corrClick2("+qaNumber+")' class='btn' value='수정'>");
					}
				}
			});
		}
	}
	
	//수정하기2, parameter = ${qa.qaNumber}
	function corrClick2(num){
		var qaNumber = num;
		var qaStep = 0; //member가 자신의 글을 수정함
		var id = '#'+qaNumber+"Send"; //textarea의 id
		var idSpan = '#'+qaNumber+"con"; //span [내용]의 id
		console.log("corrClick2입니당");
		
		//★☆이거 되는지 잘 모르겠음!!!! >> 되는듯?
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
						$(idSpan).empty(); //기존의 내용 지움
						$(idSpan).append("[수정완료]"+qaContent); //바뀐 내용 보여준다
						$(idSpan).append("<input type='button' id='corr' onclick='corrClick("+qaNumber+")' value='수정'>");
						$(idSpan).append("<input type='button' id='del' onclick='delClick("+qaNumber+")' value='삭제'>");
					}
				}
			});
		}
		
	}
	
	//삭제하기, parameter = ${qa.qaNumber}
	function delClick(num){
		var qaNumber = num;
		var qaStep = 0; //member가 자신의 글을 삭제함
		
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
					alert("데이터를 삭제했습니다");
					window.location.reload(true);
				}
			});
		}
	}
	
	
	//toggle
	$(function(){
		var check = 0;
		
		$('.qaTitleBtn').click(function(){ //class 이름 : qaTitleBtn
			/* alert("눌러짐"); */
			var id = this.id;
			if((id != '')&&(id != null)) {console.log(id);}
			//여기까지: id 받아오기 완료

			//수정이나 삭제 버튼이 아닌 경우에만 toggle 실행되어야함
			if(id !="corr"&&id !="del"){
				var data = id;
				console.log("qaNumber는 "+data);
								
				//hide를 해보자
				var liid = "#"+data+"lili";
				var liid1 = "#"+data+"1";
				var liid2 = "#"+data+"2";
				var liid3 = "#"+data+"3";
				$(liid).toggle(); //liid로 시작하는 아이디 모두 hide
				$(liid1).toggle();
				$(liid2).toggle(); 
				$(liid3).toggle(); 
				
				
				var i = 1;
				<%for(int i=1;i<10;i++){%>
				$(liid+i).toggle();
				<% }%>
							}
			
		});
			});
</script>

</head>
<body>

<jsp:include page="memberBar.jsp"></jsp:include> 

	<div class="container">
		<center>
			<div style="margin-top: 50px; margin-bottom: 50px">
				<h2>Q&A</h2>
				<br>
				<hr>
			</div>
		</center>

			<c:set var="num" value="${pg.total-pg.start+1}" />
			<form action="selQAPro.do">
				<select name="qAreply">
					<!-- 전체일 경우, 아무것도 설정 안하는 것이랑 동일하게 하기위해 null로 지정 -->
					<option value="a" selected="selected">전체 보기</option>
					<option value="y">답변완료</option>
					<option value="n">답변미완료</option>
				</select> <input type="submit" class="btn" value="필터적용">
			</form>
			
		<center>
			<table style="width: 100%; text-align: center">
				<tr>
					<th width="60px">번호</th>
					<th width="200px">상품번호</th>
					<th>문의글</th>
					<th width="200px">답변상태</th>
					<th width="200px">작성일</th>
				</tr>

				<c:forEach var="qa" items="${qAList}">
					<c:set var="userID" value="${ID}" />
					<c:set var="userID2" value="${qa.memberId}" />
					<c:set var="qaNumber" value="${qa.qaNumber}" />
					<c:if test="${qa.qaStep==0}">
						<c:if test="${userID eq userID2}">
							<tr class="trOthers">
								<td>${num}<input type="hidden" id="myID" value="${ID}"></td>
								<td><a href="tour_detail.do?gservNo=${qa.gservNo}">
									<c:if test="${qa.gservNo==0}">관리자</c:if>
									<c:if test="${qa.gservNo==1}">가이드</c:if>
									<c:if test="${qa.gservNo>1}">${qa.gservNo}</c:if>
								</a></td>
								<td class="tdTitle"><input type="hidden" class="qaContents"
									id="${qa.qaNumber}id" value="${qa.qaContent}"> <!-- 이 버튼을 누르면, 해당 객체의 아이디를 알아냄 >> ${qa.qaNumber}를 가져갈 수 있음 -->
									<%-- <input type="button" id="${qa.qaNumber}" value="${qa.qaTitle}"> --%>
									<span class="qaTitleBtn" id="${qa.qaNumber}">${qa.qaTitle }</span>
								</td>
								<c:if test="${qa.qaComplete=='n'}">
									<td style="color:blue">미완료</td>
								</c:if>
								<c:if test="${qa.qaComplete=='y'}">
									<td style="color:red">답변완료</td>
								</c:if>
								<td>${qa.qaCredate}</td>
							</tr>
							<tr>
								<td ></td>
								<td class="tdContent" colspan="2" id="${qa.qaNumber}lili" style="display: none">
									<span id="${qa.qaNumber}con">
									<table style="table-layout: fixed; width:600px;">
										<tr style="border: 1px solid lightgray;">
											<td colspan="2"><div class="divCon">${qa.qaContent}</div></td>
										</tr>
										<tr >	
											<td></td>
											<td style="text-align: right; padding-top: 10px">
												<input type="button" id="corr" class="btn btn-info"
											     	   onclick="corrClick(${qa.qaNumber})" value="수정">
												<input type="button" id="del" class="btn btn-info" 
													   onclick="delClick(${qa.qaNumber})" value="삭제">
											</td>
										</tr>
									</table>
									</span>
								</td>
								<td></td>
							</tr>
							<c:set var="num" value="${num-1}" />
							<!-- 높은숫자부터 차례로 낮아짐 -->

						</c:if>
					</c:if>
					<%-- <tbody id="${qa.qaNumber}addRow" style="position: relative;"></tbody> --%>
					<c:forEach var="qa_rpy" items="${qAList_rpy}">
						<c:set var="userID2_rpy" value="${qa_rpy.memberId}" />
						<c:set var="qaNumber_rpy" value="${qa_rpy.qaNumber}" />
						<c:if test="${qaNumber_rpy == qaNumber}">
							<tr>
								<td></td>
								<td id="${qa.qaNumber}${qa_rpy.qaStep}"
									  colspan="3" style="display: none"><div class="divCon1">
								<img src="${pageContext.request.contextPath}/items/RE.PNG" style="width: 30px">
									<pre>${qa_rpy.qaContent}</pre></div></td>
							</tr>
						</c:if>
					</c:forEach>

				</c:forEach>
			</table>
			
	<div class="pagination" style="margin-top: 50px; margin-bottom: 50px;">
		  <ul style="display: inline-block; padding: 0px; margin: auto;">
			<c:if test="${pg.startPage > pg.pageBlock }">
				<li class="page-item"><a class="page-link" href="selQAPro.do?currentPage=${pg.startPage-pg.pageBlock }&qAreply=${qAreply}"> 이전 </a></li>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<li class="page-item"><a class="page-link" href="selQAPro.do?currentPage=${i}&qAreply=${qAreply}">${i}</a></li>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<li class="page-item"><a class="page-link" href="selQAPro.do?currentPage=${pg.startPage+pg.pageBlock}&qAreply=${qAreply}"> 다음 </a></li>
			</c:if>
		  </ul>
	</div>
		</center>
	</div>
</body>
</html>