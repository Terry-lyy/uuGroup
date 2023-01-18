package com.ispan6.service.chatsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.chatsystem.Participants;
import com.ispan6.bean.membersystem.MemberBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.chatsystem.ParticipantsDAO;

@Transactional
@Service
public class ParticipantsService {
	@Autowired
	private ParticipantsDAO participantsDAO;
	
	//新增成員
	public void insertParticipants(Integer groupId,Integer personId) {
		Participants participants=new Participants();
		participants.setGroupId(groupId);
		participants.setPersonId(personId);
		participantsDAO.save(participants);
	}
//	user有幾個聊天室
	public List<Participants> selectParticipants(Integer personId) {
		
		return participantsDAO.findGroupName(personId);
		
	}
	
	public List<Participants> queryParticipants(Integer personId){
		return participantsDAO.findAllByParticipantsUserIdId(personId);
	}
	
	//測試
	public List<Participants> findGroupFile(Integer userId){
		MemberTest memberTest=new MemberTest();
		memberTest.setId(userId);
		return participantsDAO.findGroupFile(memberTest);
	}
	//群組有幾人
	public List<Participants> findGroupId(Integer groupId){
		return participantsDAO.findGroupId(groupId);
	}
}
