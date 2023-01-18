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
@Table(name="views")
public class Views {
  //聚會瀏覽
	@Id
	@Column(name="viewsid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer viewsid ;
	
	@Column(name="reunionid ")
	private Integer reunionid  ;
	
	@Column(name="number ")
	private Integer number ;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
