package com.ispan6.bean.reunionsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "Reunion")
public class Reunion {

	
	@Id
	@Column(name = "reunionid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reunionid;

	@Column(name = "topic", columnDefinition = "nvarchar(50)")
	private String topic;


	@Column(name = "content", columnDefinition = "nvarchar(50)")
	private String content;

	@Column(name = "place", columnDefinition = "nvarchar(50)")
	private String place;

	
	@Column(name = "holdTime")		// Java 環境內的格式
	private String holdTime;

	
//	@Temporal(TemporalType.TIMESTAMP)
//	@Column(name = "reviewTime")
//	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
//	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") // Java 環境內的格式
//	private Date reviewTime;
	
	
	@Column(name = "reviewTime")
	private String reviewTime;

	@Column(name = "people")
	private Integer people;
	
	@Column(name = "activity")
	private Integer activity;

//	@Column(name = "activity", columnDefinition = "nvarchar(50)")
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "activity",referencedColumnName ="reutid",insertable=false,updatable=false)
	private Reuniontype reuniontype;
    
	
	@Column(name = "payment")
	private Integer payment;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "payment",referencedColumnName ="payid",insertable=false,updatable=false)
	private Payment pay;

	@Column(name = "budget")
	private Integer budget;

	@Column(name = "picture")
	private String picture;
    
	@Column(name = "memberid")
	private Integer memberid;
	
	@Column(name = "number")
	private Integer number;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="memberid",insertable=false,updatable=false)
	private MemberTest memberTest;

	public Integer getReunionid() {
		return reunionid;
	}

	public void setReunionid(Integer reunionid) {
		this.reunionid = reunionid;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getHoldTime() {
		return holdTime;
	}

	public void setHoldTime(String holdTime) {
		this.holdTime = holdTime;
	}

	public String getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(String reviewTime) {
		this.reviewTime = reviewTime;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	public Integer getActivity() {
		return activity;
	}

	public void setActivity(Integer activity) {
		this.activity = activity;
	}

	public Reuniontype getReuniontype() {
		return reuniontype;
	}

	public void setReuniontype(Reuniontype reuniontype) {
		this.reuniontype = reuniontype;
	}

	public Integer getPayment() {
		return payment;
	}

	public void setPayment(Integer payment) {
		this.payment = payment;
	}


	public Payment getPay() {
		return pay;
	}

	public void setPay(Payment pay) {
		this.pay = pay;
	}

	public Integer getBudget() {
		return budget;
	}

	public void setBudget(Integer budget) {
		this.budget = budget;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
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

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	
}
