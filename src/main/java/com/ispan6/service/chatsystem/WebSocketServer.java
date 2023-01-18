package com.ispan6.service.chatsystem;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.ispan6.bean.chatsystem.WebsocketMessage;
import com.ispan6.controller.chatsystem.JavaMailMessages;




@ServerEndpoint("/webSocket/{username}")
@Component
public class WebSocketServer {
	private static JavaMailMessages javaMailMessages;
	@Autowired
	public void setJavaMailMessages(JavaMailMessages javaMailMessages) {
		WebSocketServer.javaMailMessages=javaMailMessages;
	}
	 //靜態變量，用來記錄當前在線連接數。應該把它設計成線程安全的。
    private static int onlineCount = 0;
    
	// concurrent包的线程安全Set，用来存放每个客户端对应的WebSocketServer对象。
	private static ConcurrentHashMap<String, Session> sessionPools = new ConcurrentHashMap<>();

	// 建立连接成功调用 
	@OnOpen
	public void onOpen(Session session, @PathParam(value = "username") String userId) {
		// 链接建立，存储链接对象
		sessionPools.put(userId, session);
		addOnlineCount();           //在線數加1
		System.out.println("你好"+userId);
		// 广播上线消息
//		WebsocketMessage msg = new WebsocketMessage();
//		msg.setFrom("系统消息");
//		msg.setDate(new Date());
//		msg.setTo("0");
//		msg.setText(userId);
//		broadcast(JSON.toJSONString(msg, true));
		WebsocketMessage msg = new WebsocketMessage();
		msg.setTo("0");
		msg.setText(String.valueOf(onlineCount));
		msg.setFrom(userId);
		broadcast(JSON.toJSONString(msg, true));
	}

	// 关闭连接时调用
	@OnClose
	public void onClose(@PathParam(value = "username") String userId) {
		
		sessionPools.remove(userId);
		subOnlineCount();           //在線數減1
		// 广播下线消息
//		WebsocketMessage msg = new WebsocketMessage();
//		msg.setFrom("系统消息");
//		msg.setDate(new Date());
//		msg.setTo("-2");
//		msg.setText(userName);
//		broadcast(JSON.toJSONString(msg, true));
		WebsocketMessage msg = new WebsocketMessage();
		msg.setTo("-2");
		msg.setText(String.valueOf(onlineCount));
		msg.setFrom(userId);
		broadcast(JSON.toJSONString(msg, true));
		
	}

	// 收到客户端信息后，根据接收人的username把消息推下去或者群发
	// to=-1群发消息
	@OnMessage
	public void onMessage(String message) throws IOException {
//		System.out.print(message);
		WebsocketMessage msg = JSON.parseObject(message, WebsocketMessage.class);
		
//		System.out.println("userId"+msg.getTo());
		msg.setDate(new Date());
		if (msg.getTo().equals("4")) {
			
			String userName=msg.getText();
			
			Session session = sessionPools.get(userName);
			if (session!=null) {
				System.out.println(userName);
				sendInfo(msg.getFrom(), JSON.toJSONString(msg, true));
				
			}
		}else if (msg.getTo().equals("-1")) {
			broadcast(JSON.toJSONString(msg, true)); // -1群发
		} else {
			for(String userId:msg.getTo().split(",")) {
				System.out.println(userId);
			sendInfo(userId, JSON.toJSONString(msg, true));
			}
		}
	}

	// 错误时调用
	@OnError
	public void onError(Session session, Throwable throwable) {
		throwable.printStackTrace();
	}

	// 给指定用户发送信息
	public void sendInfo(String userName, String message) {
		Session session = sessionPools.get(userName);
		System.out.println("session"+session);
		try {
			if (session!=null) {
			sendMessage(session, message);
			}else {
				WebsocketMessage msg = JSON.parseObject(message, WebsocketMessage.class);
//				System.out.println(javaMailMessages);
				if(userName.equals("andy911026@gmail.com") && msg.getType()==1) {
				javaMailMessages.sendToGmail(userName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 群发消息
	public void broadcast(String message) {
		for (Session session : sessionPools.values()) {
			try {
				
				sendMessage(session, message);
			} catch (Exception e) {
				e.printStackTrace();
				continue;
			}
		}
	}

	// 发送消息
	public void sendMessage(Session session, String message) throws IOException {
		if (session != null) {
			synchronized (session) {
				session.getBasicRemote().sendText(message);
			}
		}
	}
	
	public static ConcurrentHashMap<String, Session> getSessionPools() {
		return sessionPools;
	}
	
//	上線人數
	public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }
//	下線
	public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
	//取得在線人數
	public static synchronized int getOnlineCount() {
        return onlineCount;
    }
}
