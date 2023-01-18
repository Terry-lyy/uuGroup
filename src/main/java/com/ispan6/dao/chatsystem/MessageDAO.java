package com.ispan6.dao.chatsystem;

import java.util.HashSet;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;

public interface MessageDAO extends JpaRepository<MessageContent, Integer> {
	
	@Query("from MessageContent m where m.senderId=?1")
	public List<MessageContent> findWhoSender(Integer senderId);
	
	
	//查某群組有什麼訊息
	@Query("from MessageContent m where m.groupId=?1")
	public List<MessageContent>	findeGroupMessage(Integer groupId);
	
	//收回訊息
	@Modifying
	@Query(value="UPDATE messageContent set messageText=?1 where messageId=?2",nativeQuery = true)
	public void backMessage(String text,Integer messageId);
	
	//已讀
	@Modifying
	@Query(value="UPDATE messageContent set ifRead=?1 where groupId=?2 AND senderId!=?3",nativeQuery = true)
	public void readMessage(String ifRead,Integer groupId,Integer senderId);
	//已讀資訊
	@Query(value="select * from MessageContent where groupId=?1",nativeQuery = true)
	public List<MessageContent> readMessageFile(Integer groupId);
}
