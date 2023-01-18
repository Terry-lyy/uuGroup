package com.ispan6.controller.chatsystem;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class JavaMailMessages {
	@Autowired
	private JavaMailSender mailSender;

//	private String toEmail;

	public JavaMailMessages() {

	}

//	public JavaMailMessages(String toEmail) {
//		this.toEmail = toEmail;
//	}

	public void sendToGmail(String toEmail) throws Exception {
		MimeMessage mimeMailMessage = this.mailSender.createMimeMessage();
//		SimpleMailMessage message = new SimpleMailMessage();  

		try {
			MimeMessageHelper message = new MimeMessageHelper(mimeMailMessage, true, "utf-8");
			message.setTo(toEmail);
			message.setSubject("約約揪團交友平台");
			message.setText("您有新訊息～趕快去回覆吧<br><a href='http://localhost:8080/'>約約</a>", true);
			mailSender.send(mimeMailMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		System.out.println("mail sent successfully...");

	}
}
