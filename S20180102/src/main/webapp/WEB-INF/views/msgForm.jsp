<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="header_detail.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.msg td {
		padding: 10px;
	}
	.msg tr {
		padding: 10px;
	}
	
	#msgSend {
		position: absolute;
		bottom: 0px;
		width: 100%;
		height: 50px;
	}
	body {
	    padding:0;	
	    height:100%;
	}
	#wrapper {
		position:relative;
   		min-height:80%;
	}
	
	#msgBtn {
		background-color: #353535;
		border-radius: 0px;
		color:white;
		margin: 10px 0px;
		width: 49%;
		font-size: 14px;
	}
	.msg {
		width: 95%;
		margin: auto;
		background-color: white;
	}
	.msg:hover {
		cursor: pointer;
	}
	.col-md-4 {
		background-color: #eaeaea;
	}
	
	.msgSend {
	 	display: none;
	}
	
	
</style>
<script type="text/javascript">
	function toggleMsg() {
		$(".msg1").toggle();
		$(".msg2").toggle();
	}
</script>
</head>
<body>
<div style="height: 15px"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div>
				<input type="button" class="btn" id="msgBtn" value="받은 메시지함" onclick="toggleMsg()"> 
				<input type="button" class="btn" id="msgBtn" value="보낸 메시지함" onclick="toggleMsg()"> 
			</div>
				<c:forEach var="receiveDto" items="${receiveDto }"> 
					<table class="msgReceive msg msg1" style="margin-top:5px" onclick="location.href='msgForm.do?talker=${receiveDto.msgSender }'">
					<tr style="border: 1px solid gray;">
						<td width="87px" rowspan="2">
						<img src="${pageContext.request.contextPath}/images/${receiveDto.msgImg}" 
							 style="width: 66px; height: 66px; border-radius: 33px"
							 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'">
						</td>					
						<td style="font-size: 13px;"><b>${receiveDto.nickName }</b></td>
						<td>${receiveDto.msgSendate }
							<c:if test="${receiveDto.msgCheck == 'n' || receiveDto.msgCheck == 'N' }">
								<div style="border-radius: 7.5px; width: 15px; font-size: 10px; float:right; color: rgb(61,183,204); text-align: center; border: 1px solid rgb(61,183,204)"><b>N</b></div>
							</c:if>
						</td>
					</tr>
					<tr style="border: 1px solid gray;">
						<td colspan="2" style="border-top: 1px solid lightgray;">${receiveDto.msgContent }</td>
					</tr>
					</table>
				</c:forEach>
				<c:forEach var="sendDto" items="${sendDto }"> 
		   		  <table class="msgSend msg msg2" style="margin-top:5px" onclick="location.href='msgForm.do?talker=${sendDto.msgReceiver }'">
					<tr style="border: 1px solid gray;">
						<td width="87px" rowspan="2"><img src="${pageContext.request.contextPath}/images/${sendDto.msgImg}" style="width: 66px; height: 66px; border-radius: 33px"></td>					
						<td style="font-size: 13px;"><b>${sendDto.nickName }</b></td>
						<td>${sendDto.msgSendate }
							<c:if test="${sendDto.msgCheck == 'n' || sendDto.msgCheck == 'N' }">
								<div style="border-radius: 7.5px; width: 15px; font-size: 10px; 
								      float:right; color: rgb(61,183,204); text-align: center; 
								      border: 1px solid rgb(61,183,204)"><b>N</b></div>
							</c:if>
						</td>
					</tr>
					<tr style="border: 1px solid gray;">
						<td colspan="2" style="border-top: 1px solid lightgray;">${sendDto.msgContent }</td>
					</tr>
				  </table>
				</c:forEach>
			
		</div>
		<div class="col-md-8">
		  <div id="wrapper">
			  <div style="border-bottom: 1px solid gray; height: 120px;">
			  	<form action="msgForm.do">
			  		<input type="text" name="search" class="form-control" style="width: 50%; display: inline-block; padding: 3px 10px; font-size: 14px" 
			  			    placeholder="아이디/이름/닉네임으로 대화상대를 검색해보세요.">
			  		<input type="submit" value="검색" class="btn" style="padding: 0px 10px">
			  	</form>
			  	<c:if test="${talkerDto != null }">
				 <table style="width: 200px; height: 30px">
					<tr>
						<td rowspan="2"><img src="${pageContext.request.contextPath}/images/${talkerDto.mimg}" 
											 style="width: 66px; height: 66px; border-radius: 33px"
											 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'"></td>					
						<td style="font-size: 13px; width: 200px"><b>${talkerDto.mname }(${talkerDto.memberId })</b></td>
					</tr>
				</table>		  	
			  	</c:if>
			  </div>
		<c:if test="${mbDto == null }"> 
		  	<c:forEach var="msgDto" items="${msgDto }">
		  		<c:if test="${msgDto.msgSender == ID }">
				  <table style="clear:both; float:right; width: 250px">
		  		</c:if> 
		  		<c:if test="${msgDto.msgSender != ID }">
				  <table style="clear:both; float:left; width: 250px">
		  		</c:if> 
		  			<tr>
		  				<td rowspan="2">
		  				<img src="${pageContext.request.contextPath}/images/${msgDto.msgImg}" 
		  					  style="width: 40px; height: 40px; border-radius: 20px;"
		  					  onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'">
		  				</td>					
		  				<td style="font-size: 13px; padding-left: 15px"><b>${msgDto.nickName }</b></td>
						<td style="float:right">${msgDto.msgSendate }<br></td>
		  			</tr>
		  			<tr>
						<td colspan="2" style="padding: 5px 15px; background-color: #EAEAEA; border-radius: 0.5em">${msgDto.msgContent }</td>
					</tr>
					<tr><td colspan="3" style="height: 10px"></td></tr>
			  	</table>
		  	</c:forEach>
			<div id="msgSend">
				<form action="inMsgTalk.do">
				 <input type="hidden" name="msgReceiver" value="${talker }">
				 <input type="hidden" name="msgSender" value="${ID }">
					<input type="text" name="msgContent" placeholder="메시지를 입력하세요" class="form-control" style="width: 90%; display: inline-block;">			
					<input type="submit" class="btn btn-info" value="전송">
				</form>
			</div>
		</c:if>
		<c:if test="${mbDto !=null }">
			<c:forEach var="mbDto" items="${mbDto }">
				 <table style="margin-top:30px; margin-left:30px; width: 400px; height: 70px">
					<tr>
						<td rowspan="2"><img src="${pageContext.request.contextPath}/images/${mbDto.mimg}" 
											 style="width: 66px; height: 66px; border-radius: 33px"
											 onerror="this.src='${pageContext.request.contextPath}/items/logo22.png'"></td>					
						<td style="font-size: 13px; width: 200px"><b>${mbDto.mname }(${mbDto.memberId })</b></td>
						<td rowspan="2">
							<input type="button" style="font-size: 13px;" class="btn btn-info" value="> 대화하기"
								   onclick="location.href='msgForm.do?talker=${mbDto.memberId}'">
						</td> 
					</tr>
					<tr>
						<c:if test="${mbDto.authority == '1' }">
							<td>회원</td>
						</c:if>
						<c:if test="${mbDto.authority == '2' }">
							<td>가이드</td>
						</c:if>
						<c:if test="${mbDto.authority == '3' }">
							<td>관리자</td>
						</c:if>
					</tr>
				  </table>
			</c:forEach>
		</c:if>
		
		 
		  </div>	
		</div>
	</div>
</div>
</body>
</html>