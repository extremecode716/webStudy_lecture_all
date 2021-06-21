<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 채팅</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 새로 추가된 부분(시작) -->
<style>

#chat {
	position: fixed;
	width: 230px;
	height: auto;
	padding: 10px;
	background: #088A68;
	color: #EDEDED;
	text-align: center;
	font-family: Cambria;
	font-size: 20px;
	bottom: 0px;
	right: 15px;
	cursor: pointer;
}

#chatBox {	
	display: none;
	position: fixed;
	width: 230px;
	height: 300px;
	padding: 10px;
	background: lightgrey;
	color: #FF7700;
	box-shadow: 0 0 0.1em #000;
	text-align: left;
	font-family: Cambria;
	font-size: 15px;
	bottom: 0px;
	right: 15px;
	cursor: pointer;
}

#close {
	position: absolute;
	width: 15px;
	height: 15px;
	padding: 6px 5px 10px 5px;
	text-align: center;
	background: lightgrey;
	color: #FF7700;
	font-family: Cambria;
	right: 10px;
	top: 0px;
}

#font {
	font-size: 13px;
	text-align: center;
}

#message, #button{
	width:210px;
	height:18px;
}

#message,#chatMessageArea{
	font-size : 10px;
}

#sendBtn {
	height: 25px;
	padding: 0px;
}
</style>

<script>

	function open_chatbox() {			// Chat Now
		$('#chat').fadeOut(500);
		$('#chatBox').fadeIn(1000);	
		$('#chatMessageArea').val('');
	}
	function closeChat() {				// X
		$('#chatBox').fadeOut(500);
		$('#chat').fadeIn(1000);
		$('#chatMessageArea').val('');
	}

</script>

<!-- 새로 추가된 부분(끝) -->

<% String context = request.getContextPath(); %>

<script type="text/javascript">

var websock;
	$(function() {
		
		// msg 입력후 엔터
		$('#message').keypress(function(event) {
			var keycode=event.keyCode?event.keyCode:event.which;
			if (keycode==13) send();
			event.stopPropagation();
		});
		
		
		// 관리자 입장
			$('#chat').click(function() {	connect(); });
		
		// 관리자 퇴장
			$('#close').click(function() {  disconnect(); });
		
		// 관리자 전송
			$('#sendBtn').click(function() {	send(); });
		
});
	
	
	
	// 관리자 전송
	/* function send() {
		var nickName = $('#nickName').val();
		var msg = $('#message').val();
		websocket.send('msg:'+nickName+' => '+msg);
		$('#message').val('');		
	} */
	
	// 관리자 입장
	function connect() {	
		alert("connect success");    //접속 확인용 alert
	    $.ajax({
	        type:"POST",	        
	        url:"admin_connect.do",
	  //      data: {"id":memid},	       
	        success: function (data) {	      	   
	        	//alert("cnt수:"+data);	      	   
	      		  
	        	$("#cnt").text(data+"명")	 //db 확인용 몇명?       	
	        	
	      		websock =
	      		  new WebSocket("ws://localhost:8181/s20180102/chat-ws.do");
	      		websock.onopen=onOpen;
	      		websock.onclose=onClose;
	      		websock.onmessage=onMessage;
	      	       		
	        }
	        
	      });		
		
	}	
	
	// 관리자 퇴장
	function disconnect() {		
	
		$.ajax({
	        type:"POST",	        
	        url:"admin_close.do",	               
	        success: function (data) { 
	        
	        	alert("퇴장 되었습니다.");
	        	    	        		  
	        /* 	$("#cnt").text(data+"명"); */
	      			        	
	      	  }       
	        
	      });		
		
		websock.close();	
	}
	
	// 관리자 전송 부분
	function send() {
		
		var message  = $('#message').val();
		websock.send('msg: 관리자 :'+ message);
		$('#message').val('');		
		
	}
	
	function onOpen(event) {  appendMessage("상담요청하는 회원과 연결되었습니다.\n");	}
	
	function onClose(event) { appendMessage("연결이 종료되었습니다.\n");}
	
	function onMessage(event) {
		var data = event.data;
		appendMessage(data);
	}
	
	function appendMessage(msg) {
		
 		var area = $('#chatMessageArea');
 		area.val(area.val() + "\n" + msg);
		
	}
	
</script>
</head>

<body> <br><br><br>


<!-- chat Form(시작) -->
	<div id="chat" onClick="open_chatbox();">Chat Now</div>
	<div id="chatBox">
		<div  onclick="closeChat()" id="close">X</div>
		<br>
		<p id="font">실시간 채팅</p>

		<textarea rows="13" cols="37" id=chatMessageArea readonly="readonly"></textarea>
		<input type="text" id="message" required="required" >
		<input type="button" value="send" id="sendBtn"class="btn btn-info btn-block" >
	</div>
<!-- Form(끝) -->


</body>
</html>