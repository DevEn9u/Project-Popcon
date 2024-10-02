package com.edu.springboot.websocket;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChatController {
	private final SimpMessagingTemplate messagingTemplate;
	
	// 클라이언트에서 메시지를 보낼 때 호출되는 메서드
	@MessageMapping("/sendMessage.do") 
	 private void sendMessage(ChatMessage message) {
		 // message.getReceiverId()로 수신자의 ID를 가져와서 해당 ID로 메시지를 전송
		messagingTemplate.convertAndSendToUser(message.getReceiver(), "/private", message);
	}

}
