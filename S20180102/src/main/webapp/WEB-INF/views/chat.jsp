<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chat</title>
<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">	
</script> -->

<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
#chat {
	position: fixed;
	width: 250px;
	height: auto;
	padding: 10px;
	background: #848484;
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
	width: 250px;
	height: 350px;
	padding: 10px;
	background: lightgrey;
	color: #FF7700;
	box-shadow: 0 0 0.1em #000;
	text-align: center;
	font-family: Cambria;
	font-size: 20px;
	bottom: 30px;
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

#message, #button {
	width: 230px;
	height: 15px;
}

#message, #chatMessageArea {
	font-size: 12px;
}

#sendBtn {
	height: 25px;
	padding: 0px;
}
</style>

</head>


<body>

	<div id="chat" onClick="open_chatbox();">Chat Now</div>
	<div id="chatBox">
		<div onclick="closeChat()" id="close">X</div>
		<br>
		<p id="font">실시간 채팅</p>
		
			<textarea rows="13" cols="34" readonly="readonly" id="chatMessageArea"></textarea>
		
		<input type="text" id="message" required="required">
		<input type="button" value="send" id="sendBtn" class="btn btn-info btn-block">
	</div>

</body>



<script type="text/javascript">

	/* 추가된부분 */
	
	function open_chatbox() {
		//chat start
			$('#chat').fadeOut(500);
			$('#chatBox').fadeIn(1000);
			$('#chatMessageArea').val('');
	}
	
	function closeChat() {
		//close img X
			$('#chat').fadeIn(1000);
			$('#chatBox').fadeOut(500);
			$('#chatMessageArea').val('');
	}

</script>

<% String context = request.getContextPath(); %>

<script type="text/javascript">
	
	var websock;
		$(function() {
		
			//msg 입력후 엔터
			$('#message').keypress(function(event) {
				var keycode=event.keyCode?event.keyCode:event.which;
				if (keycode==13) send();
				event.stopPropagation();
			});
			
			
			//일반인 입장
			$('#chat').click(function() {  connect();	});
			
			//일반인 퇴장
			$('#close').click(function() { disconnect();	});
			
			//msg 전송
			$('#sendBtn').click(function() { send(); });
			
		});	
			
			//입장
			function connect() {
				alert("connect ok")
				 $.ajax({
				        type:"POST",	        
				        url:"chat_connect.do",	       	       
				        success: function (data) { 
//				        	alert(data+"째 접속");
				        	
				          if(data == 0 || data == 1){	 // 관리자가 접속하기 전에 접속한 경우
				        	alert("잠시만 기다려 주세요")
				        	return false;
				        	
				          }else if(data == 2){
				      		alert("접속 되었습니다.");
				      		   
				      		websock =
					      		  new WebSocket("ws://localhost:8181/s20180102/chat-ws.do");
					      		websock.onopen=onOpen;
					      		websock.onclose=onClose;
					      		websock.onmessage=onMessage; 
					     
				      	  } else if(data > 2){
				      		alert("잠시만 기다려 주세요");
				        	return false;	      			      		  
				      		
				      	  }       	  
				        }
				        
				      });	

				
			}
		
		
		//퇴장(퇴장시 cnt 값을 1감소 시킴)
		function disconnect() {
			
			$.ajax({
				
				type:"POST",
				url:"chat_close.do",				
					success: function (data) {
						alert("퇴장하였습니다.");
						alert("cnt수 : "+data);
						
						/* $("#cnt").text(data+"명"); */
					}
				
			});
			
			websock.close();
			
		}	
		// 전송부분
		function send() {
		
		//ID 세션으로 받기 
		/* var ID=${sessionScope.ID}.val(); */
		/* alert("ID -> "+ ID) */
		
		var message  = $('#message').val();
		websock.send('msg: 회원 :'+ message);
		$('#message').val('');		
		
	}
	
	function onOpen(event) {  appendMessage("상담원과 연결되었습니다.\n");	}
	
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
</html>