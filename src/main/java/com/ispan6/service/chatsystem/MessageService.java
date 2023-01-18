package com.ispan6.service.chatsystem;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.membersystem.MemberBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.chatsystem.MessageDAO;



@Transactional
@Service
public class MessageService {
	@Autowired
	private MessageDAO messageDAO;
	
	
	public void insertOrUpdate(MessageContent msg) {
		messageDAO.save(msg);
	}
	
	//新增訊息
	public MessageContent insertMessage(String text,Integer senderId,Integer groupId) {
		MessageContent msgText=new MessageContent();
		msgText.setSenderId(senderId);
		msgText.setGroupId(groupId);
		msgText.setMessageText(text);
		messageDAO.save(msgText);
		return msgText;
	}
	//搜尋誰傳的訊息 測試
	public List<MessageContent> findWhoSender(Integer senderId) {
		
		return messageDAO.findWhoSender(senderId);
	}
	
	//查某群組有什麼訊息
	public List<MessageContent>	findeGroupMessage(Integer groupId){
		return messageDAO.findeGroupMessage(groupId);
	}
	
	//收回訊息
	public void backMessage(String text,Integer messageId) {
		messageDAO.backMessage(text, messageId);
	}
	//已讀
	public void readMessage(String ifRead,Integer groupId,Integer senderId) {
		messageDAO.readMessage(ifRead, groupId, senderId);
	}
	//已讀資訊
	public List<MessageContent> readMessageFile(Integer groupId){
		return messageDAO.readMessageFile(groupId);
	}
}
