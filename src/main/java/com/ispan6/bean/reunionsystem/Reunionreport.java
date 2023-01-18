package com.ispan6.bean.reunionsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name="reunionreport")
public class Reunionreport {
  //聚會檢舉
	@Id
	@Column(name="reunionreportid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reunionreportid ;
	
	
	@Column(name="reunionid ")
	private Integer reunionid ;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="reunionid",referencedColumnName ="reunionid",insertable=false,updatable=false)
	private Reunion reunion ;
	
	@Column(name="memberid ")
	private Integer memberid ;
	


	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="memberid",referencedColumnName="m_id",insertable=false,updatable=false)
	private MemberTest memberTest ;
	
	@Column(name="content",columnDefinition ="nvarchar(50)")
	private String content;

	public Integer getReunionreportid() {
		return reunionreportid;
	}

	public void setReunionreportid(Integer reunionreportid) {
		this.reunionreportid = reunionreportid;
	}

	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Reunion getReunion() {
		return reunion;
	}

	public void setReunion(Reunion reunion) {
		this.reunion = reunion;
	}

	public MemberTest getMemberTest() {
		return memberTest;
	}

	public void setMemberTest(MemberTest memberTest) {
		this.memberTest = memberTest;
	}

	public Integer getReunionid() {
		return reunionid;
	}

	public void setReunionid(Integer reunionid) {
		this.reunionid = reunionid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
