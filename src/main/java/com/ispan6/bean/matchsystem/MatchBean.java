package com.ispan6.bean.matchsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "friend")
public class MatchBean {

//	create table friend( 
//			friendid int primary key identity(1,1),
//			userid int foreign key references memberTest(m_id),--自己ID
//			fuid int foreign key references memberTest(m_id),--好友ID
//			isFriend int default 0,--是不是朋友
//			roomid int,--房間ID
//			foreign key (roomId) references grouproom(groupId),
//		);
	@Id
	@Column(name = "friendid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer friendid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private MemberTest userid;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fuid")
	private MemberTest fuid;
	@Column(name = "isFriend")
	private Integer isFriend;
	@Column(name = "whoblocked")
	private Integer whoblocked;
	
	public Integer getWhoblocked() {
		return whoblocked;
	}
	public void setWhoblocked(Integer whoblocked) {
		this.whoblocked = whoblocked;
	}
	public Integer getFriendid() {
		return friendid;
	}
	public void setFriendid(Integer friendid) {
		this.friendid = friendid;
	}
	public MemberTest getUserid() {
		return userid;
	}
	public void setUserid(MemberTest userid) {
		this.userid = userid;
	}
	public MemberTest getFuid() {
		return fuid;
	}
	public void setFuid(MemberTest fuid) {
		this.fuid = fuid;
	}
	public Integer getIsFriend() {
		return isFriend;
	}
	public void setIsFriend(Integer isFriend) {
		this.isFriend = isFriend;
	}
	
	
}
