package com.ispan6.bean.reunionsystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="evaluate")
public class Evaluate {
  //聚會評價
	@Id
	@Column(name="evaluateid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer evaluateid ;
	
	@Column(name="reunionid ")
	private Integer reunionid  ;
	
	@Column(name="memberid ")
	private Integer memberid ;
	
	@Column(name="score ")
	private Integer score ;
	
	@Column(name="comment", columnDefinition = "nvarchar(50)")
	private String comment;

	public Integer getEvaluateid() {
		return evaluateid;
	}

	public void setEvaluateid(Integer evaluateid) {
		this.evaluateid = evaluateid;
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

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
