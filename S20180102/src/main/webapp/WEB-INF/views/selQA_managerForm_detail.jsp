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

//수정하기 - 내용 수정 입력란 만들어줌
function updateButton(step){
	var qaStep = step; //qaStep을 받아온다
	var qaNumber = $('#qaNum').val(); //qaNumber
	var id = "#"+qaStep+"content"; //tr ID
	//같이 없애려고..
	var idMem = "#"+qaStep+"member";
	var idCre = "#"+qaStep+"credate";
	var idBtn = "#"+qaStep+"button";
	//ajax
	var dataIn = {};
	dataIn = {
			qaNumber : qaNumber,
			qaStep : qaStep,
	}
	if(qaStep>0){
		$.ajax({
			type : 'POST',
			url : '<%=context%>/shCon/corrQA.do',
			data : dataIn,
			success : function(data){
				alert("되돌아옴"); 
				//수정할 칸을 만들어준다
				if(data < 1){
					$(id).empty(); //기존의 내용 지움
					$(idMem).empty(); 
					$(idCre).empty(); 
					$(idBtn).empty(); 
					
					//수정 입력칸 생성
					$(id).append("<td>답변 수정</td>");
					$(id).append("<textarea rows='3' cols='70' id="+qaStep+"Send value='수정할 내용을 입력하세요'>");
					$(id).append("<br><input type='button' class='btn btn-info' style = 'margin: 10px; text-align: right;' onclick='corrClick2("+qaNumber+","+qaStep+")' value='제출'>");
				}
			}
		});
	}
}
//수정하기2
function corrClick2(num1,num2){
		var qaNumber = num1;
		var qaStep = num2; //member가 자신의 글을 수정함
		
		//각각의 칸에 내용 삽입
		var id = "#"+qaStep + "Send";
		var idCon = "#"+qaStep+"content"; 
		var idMem = "#"+qaStep+"member";
		var idCre = "#"+qaStep+"credate";
		var idBtn = "#"+qaStep+"button";
		
		console.log("corrClick2입니당");
		
		var qaContent = $(id).val(); //내용
		alert("qaContent = "+qaContent);
		
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
					if(data > 0){
						alert("수정 완료!");
						$(idCon).empty(); //기존의 내용 지움
						window.location.reload(true);  
						/* $(idCon).append("<td>수정 답변</td><td>"+qaContent+"</td>");
						$(idMem).append("<td>작성자</td><td>"+data['memberId']+"</td>");
						$(idCre).append("<td>작성일</td><td>"+data['qaCredate']+"</td>");
						$(idBtn).append("<td></td><td><input type='button' value='수정'	onclick='updateButton("+qaStep+")'> <input type='button' value='삭제' onclick='deleteButton("+qaStep+")'></td>"); */
					}
				}
			});
		}
		
	}

//삭제하기
	function delClick(num1,num2){
		var qaNumber = num1;
		var qaStep = num2; 
		
		var id = "#"+qaStep+"content"; //tr ID
		//같이 없애려고..
		var idMem = "#"+qaStep+"member";
		var idCre = "#"+qaStep+"credate";
		var idBtn = "#"+qaStep+"button";
		
		//ajax
		//VO형식의 parameter
		var dataIn = {};
		dataIn = {
				qaNumber : qaNumber,
				qaStep : qaStep,
		}
		alert("dataIn.qaNumber => "+dataIn.qaNumber+", dataIn.qaStep => "+dataIn.qaStep);
		
		//받아간 것을 가져가서.. 삭제합니다 
		if(dataIn !=null){
			$.ajax({
				type : 'POST',
				url : '<%=context%>/shCon/delQA.do',
				data : dataIn,
				success : function(data){ //
					$(id).empty(); //기존의 내용 지움
					$(id).append("<td colspan='2'>삭제되었습니다<td>");
					$(idMem).empty(); //기존의 내용 지움
					$(idCre).empty(); //기존의 내용 지움
					$(idBtn).empty(); //기존의 내용 지움
				}
			});
		}
	}

//답변달기 등록
function inReply(){ //버튼을 누르면 id값 가져올 수 있도록..
	alert("버튼을 누름 inReply()");
	
	//VO에 담을 parameter
	var send_qAnumber = $('#qaNum').val();
	var send_qAcontent = $('#replyContent').val();
	var send_qAreceiver = $('#receiver').val(); 
	var send_gServNo = 1;
	var send_memberId = $('#writerId').val();
	
	//VO형식의 parameter
	var dataIn={};
	dataIn = {
			qaNumber : send_qAnumber,
			qaContent : send_qAcontent,
			qaReceiver : send_qAreceiver,
			gservNo : send_gServNo,
			memberId : send_memberId,
	}
	
	if(send_qAcontent!=null){
		$.ajax({
			type : 'POST',
			url : '<%=context%>/shCon/writeQA.do',
			data : dataIn,
			success : function(data){
				if (data == null || data == '') {
					data = 0;
				}
				window.location.reload(true);
			}
		});
	}
}

</script>


<style type="text/css">

table {
	 /* width: 100%; */
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
tr.trOthers {
	background-color: #F2F2F2;
}
td.tdContent {
	padding : 5px;
}
td.tdTitle:hover {
	font-weight: bold;
	background-color: #D8D8D8;
}
.divCon {
	/* background-color : aliceBlue; */
	border : 1px solid aliceBlue;
}

</style>
</head>

<body>
	<!-- 받은 param : qADto -->
	<jsp:include page="managerBar.jsp"></jsp:include>
	<div class="container">
		<center>
			<div style="margin-top: 30px; margin-bottom: 50px">
				<h5><b>답변 등록</b></h5>
				<br>
				<hr>
			</div>
		<table class="table" style="width: 60%">
			<tr>
				<td width="100px">[ 제목 ]</td>
				<td colspan="2">${qADto.qaTitle }<input type="hidden" id="qaNum"
					value="${qADto.qaNumber}"></td>
			</tr>
			<tr>
				<td width="100px">작성자</td>
				<td colspan="2">${qADto.memberId}<input type="hidden" id="receiver"
					value="${qADto.memberId}"></td>
			</tr>
			<tr>
				<td width="100px">작성일</td>
				<td colspan="2">${qADto.qaCredate}</td>
			</tr>
			<tr>
				<td colspan="3">▶  ${qADto.qaContent}</td>
				<input type="hidden" id="writerId" value="${ID}">
			</tr>
			<!-- 답변이 있을 경우 답변도 보여준다 -->
			<c:forEach var="list" items="${qADto_rpy}">
					<tr id="${list.qaStep}content">
						<td></td>
						<td width="100px">&nbsp 답변</td>
						<td>${list.qaContent}</td>
					</tr>
					<tr id="${list.qaStep}member">
						<td></td>
						<td width="100px">&nbsp 작성자</td>
						<td>관리자</td>
					</tr>
					<tr id="${list.qaStep}credate">
						<td></td>
						<td width="100px">&nbsp 작성일</td>
						<td>${list.qaCredate}</td>
					</tr>
					<tr id="${list.qaStep}button">
						<td></td>
						<td colspan="2" style="text-align: right;"><input type="button" value="수정" class="btn btn-info"
							onclick="updateButton(${list.qaStep})"> <input
							type="button" class="btn btn-info" value="삭제" onclick="delClick(${list.qaNumber},${list.qaStep})"></td>
					</tr>
			</c:forEach>

			<!-- 답변 달기 (ajax로) -->
			<tbody id="inReply"></tbody>
			<!-- 답변 다는 칸 -->
			<tr>
				<td width="100px">답변 달기</td>
				<td colspan="2" style="text-align: right;">
				<textarea id="replyContent" cols="60" class="form-control"></textarea>
				<input type="button" value="Comment" class="btn" style="margin-top: 10px;" onclick="inReply()"></td>
			</tr>
		</table>
		<!-- 답변 추가로 다는 란 -->
	</center>
	</div>
</body>
</html>