package com.ispan6.dao.postsystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public class PostDto {
	
	@JsonProperty("msg")
	private String text;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "postTime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	private Date posttime;
	



public Date getPosttime() {
		return posttime;
	}



	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}



public PostDto() {
	
   }



public String getText() {
	return text;
}



public void setText(String text) {
	this.text = text;
}


}