package com.ispan6.utils;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.ispan6.bean.membersystem.MemberTest;

@Component
public class CodeUtils {

    @Autowired
    JavaMailSender mailSender;

    // 生成链接,并给接收的邮箱发送邮件
    public boolean sendCode(HttpSession session, MemberTest mt){
        MimeMessage message = mailSender.createMimeMessage();
        try{
            MimeMessageHelper messageHelper = new MimeMessageHelper(message);
            String token = UUID.randomUUID().toString(); // 生成UUID
            session.setAttribute("token", token);
            messageHelper.setFrom("peter4283@gmail.com"); //发送方的邮箱地址，而不是接收方的邮箱地址
            messageHelper.setTo(mt.getEmail()); // 接收方的邮箱地址
            messageHelper.setSubject("歡迎使用約約");  // 邮箱标题
            String html = "<html>\n" +
                    "<body>\n" +
                    "<p>您的驗證碼為：</p>" +
                    token+"\n"+
                    "</body>\n" +
                    "</html>";
            messageHelper.setText(html,true); // 邮箱内容
            mailSender.send(message);  // 发送邮箱
            System.out.println("成功");
            return true;
        }catch (Exception e){
            System.out.println("失败");
            return false;
        }
    }
    
    public boolean sendCode2(HttpSession session, String account){
        MimeMessage message = mailSender.createMimeMessage();
        try{
            MimeMessageHelper messageHelper = new MimeMessageHelper(message);
            String code = UUID.randomUUID().toString(); // 生成UUID
            session.setAttribute("code", code);
            messageHelper.setFrom("peter4283@gmail.com"); //发送方的邮箱地址，而不是接收方的邮箱地址
            messageHelper.setTo(account); // 接收方的邮箱地址
            messageHelper.setSubject("來自約約的信");  // 邮箱标题
            String html = "<html>\n" +
            		 "<body>\n" +
                     "<p>請點擊下方連接繼續</p>\n" +
                     "<a href=\"http://localhost:8080/lookCode/"+code+"\">http://localhost:8080/lookCode/"+code+"</a>" +
                     "</body>\n" +
                     "</html>";
            messageHelper.setText(html,true); // 邮箱内容
            mailSender.send(message);  // 发送邮箱
            System.out.println("成功");
            return true;
        }catch (Exception e){
            System.out.println("失败");
            return false;
        }
    }

    // 判断token是否过期
//    public boolean eqToken(String token){
//        return redisTemplate.hasKey(token);
//    }

    // 根据token查询用户的信息
//    public MemberTest findUser(String token){
//        return redisTemplate.opsForValue().get(token);
//    }
}
