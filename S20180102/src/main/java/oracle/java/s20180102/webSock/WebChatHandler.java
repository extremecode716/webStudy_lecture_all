//package com.ch.webSock;
package oracle.java.s20180102.webSock;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebChatHandler extends TextWebSocketHandler { 
	
	// 웹소켓 세션을 저장할 Map객체 생성
	Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	// 클라이언트와 연결된 후 실행
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.put(session.getId(), session);
	}
	
	// 클라이언트와 연결이 끊어진 경우에 실행
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
	}
	
	// 웹소켓 서버로 데이터를 전송했을 경우 실행
	protected void handleTextMessage(WebSocketSession session, 
			TextMessage message) throws Exception {
			String msg = message.getPayload();
			TextMessage tMsg = new TextMessage(msg.substring(4));
			Collection<WebSocketSession> list = users.values();
			for (WebSocketSession wss : list) {
				wss.sendMessage(tMsg);
		}
	}
	
}