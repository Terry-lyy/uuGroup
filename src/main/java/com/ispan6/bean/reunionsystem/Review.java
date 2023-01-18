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
@Table(name="review")
public class Review {
  //聚會審核
	@Id
	@Column(name="reviewid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reviewid ;
	
	@Column(name="reunionid ")
	private Integer reunionid  ;
	
	@Column(name="memberid ")
	private Integer memberid ;
		
	@Column(name="reviewStatus", columnDefinition = "nvarchar(50)")
	private String reviewStatus;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
