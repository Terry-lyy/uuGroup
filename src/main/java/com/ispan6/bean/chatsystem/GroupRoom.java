package com.ispan6.bean.chatsystem;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;


import com.fasterxml.jackson.annotation.JsonIgnore;

import com.ispan6.bean.matchsystem.MatchBean;

//聊天室
@Entity
@Table(name="grouproom")
public class GroupRoom implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public GroupRoom() {
		
	}
	public GroupRoom(Integer groupId,Set<Participants> participants,List<MessageContent> messageText) {
		
	}
	@Id
	@Column(name="GROUPID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int groupId;
	
	//房間名
	@Column(name="GROUPNAME")
	private String groupName;
	
	//0好友 1群組
	@Column(name="GROUPTYPE")
	private int groupType;
	
	@Column(name="GROUPPHOTO")
	private String groupPhoto;
	
	@Column(name="REUNIONID")
	private Integer reunionId;
	
	//一個聊天室 不重複玩家
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "groupRoomId",cascade = CascadeType.ALL)
	private Set<Participants> participants=new HashSet<Participants>();
	
	//按照順序依照id大小出現訊息
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "groupRoomId",cascade = CascadeType.ALL)
	private List<MessageContent> messageText;
	
	
	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getGroupType() {
		return groupType;
	}

	public void setGroupType(int groupType) {
		this.groupType = groupType;
	}
	
	

	public String getGroupPhoto() {
		return groupPhoto;
	}
	public void setGroupPhoto(String groupPhoto) {
		this.groupPhoto = groupPhoto;
	}
	public Set<Participants> getParticipants() {
		return participants;
	}

	public void setParticipants(Set<Participants> participants) {
		this.participants = participants;
	}

	public List<MessageContent> getMessageText() {
		return messageText;
	}

	public void setMessageText(List<MessageContent> messageText) {
		this.messageText = messageText;
	}
	public Integer getReunionId() {
		return reunionId;
	}
	public void setReunionId(Integer reunionId) {
		this.reunionId = reunionId;
	}
	
	
	
	
	
	
}
