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

import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name="register")
public class Register {
  //聚會報名
	@Id
	@Column(name="registerid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer registerid ;
	
	
	
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
	
	
	@Column(name="review ")
	private Integer review ;

	
	public Integer getRegisterid() {
		return registerid;
	}

	public void setRegisterid(Integer registerid) {
		this.registerid = registerid;
	}

	public Integer getReunionid() {
		return reunionid;
	}

	public void setReunionid(Integer reunionid) {
		this.reunionid = reunionid;
	}

	public Reunion getReunion() {
		return reunion;
	}

	public void setReunion(Reunion reunion) {
		this.reunion = reunion;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public MemberTest getMemberTest() {
		return memberTest;
	}

	public void setMemberTest(MemberTest memberTest) {
		this.memberTest = memberTest;
	}

	public Integer getReview() {
		return review;
	}

	public void setReview(Integer review) {
		this.review = review;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
