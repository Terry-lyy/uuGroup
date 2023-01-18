package com.ispan6.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;
import org.springframework.web.util.WebAppRootListener;

/**
 * WebScoket配置处理器
 */
@Configuration
public class WebSocketConfig implements ServletContextInitializer{
	/**
	 * ServerEndpointExporter 作用 这个Bean会自动注册使用@ServerEndpoint注解声明的websocket endpoint
	 */
	@Bean
	public ServerEndpointExporter serverEndpointExporter() {
		return new ServerEndpointExporter();
	}
	@Override
	public void onStartup (ServletContext servletContext) throws ServletException {
		servletContext.addListener(WebAppRootListener.class);
		servletContext.setInitParameter("org.apache.tomcat.websocket.textBufferSize","99999999"); 
//		servletContext.setInitParameter("org.apache.tomcat.websocket.binaryBufferSize","52428800");
	}
}
