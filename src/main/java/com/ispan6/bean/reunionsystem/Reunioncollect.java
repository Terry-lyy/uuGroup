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
@Table(name="reunioncollect")
public class Reunioncollect {
  //聚會收藏
	@Id
	@Column(name="reunioncollectid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reunioncollectid ;
	
	@Column(name="reunionid ")
	private Integer reunionid  ;
	
	@Column(name="memberid ")
	private Integer memberid ;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
