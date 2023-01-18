package com.ispan6.bean.chatsystem;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name="messagecontent")
public class MessageContent implements Serializable{
	private static final long serialVersionUID = 1L;
	public MessageContent() {
		
	}

	@Id
	@Column(name="MESSAGEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int messageId;
	
	//誰發的訊息
	@Column(name="SENDERID")
	private int senderId;
	
	//傳到哪個房間
	@Column(name="GROUPID")
	private int groupId;
	
	//訊息內容
	@Column(name="MESSAGETEXT")
	private String messageText;
	
	//已讀
	@Column(name="IFREAD")
	private String ifRead;
	
	//發訊息時間
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATEAT")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss") // Java 環境內的格式
	private Date createAt;
	
	
	@PrePersist  // 當物件要從 Transient 狀態轉換成 Persistent 狀態時，先做...(連線狀態
	public void prePersist() {
		if(createAt == null) {
			createAt = new Date();
		}
	}
	
	//雙向
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="SENDERID",insertable=false,updatable=false)
	@JsonIgnore
	private MemberTest messageContentUserId;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinColumn(name="GROUPID",insertable=false,updatable=false)
	@JsonIgnore
	private GroupRoom groupRoomId;
	
//	@OneToOne(mappedBy = "id",cascade = CascadeType.ALL)
//	private List<MemberTest> memberTestFile;

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getMessageText() {
		return messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public MemberTest getMessageContentUserId() {
		return messageContentUserId;
	}

	public void setMessageContentUserId(MemberTest messageContentUserId) {
		this.messageContentUserId = messageContentUserId;
	}

	public GroupRoom getGroupRoomId() {
		return groupRoomId;
	}

	public void setGroupRoomId(GroupRoom groupRoomId) {
		this.groupRoomId = groupRoomId;
	}

	public String getIfRead() {
		return ifRead;
	}

	public void setIfRead(String ifRead) {
		this.ifRead = ifRead;
	}

	
	


	
	
}
