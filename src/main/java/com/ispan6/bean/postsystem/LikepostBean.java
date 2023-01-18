package com.ispan6.bean.postsystem;

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

@Entity
@Table(name = "likepost")
public class LikepostBean {
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "postid")
	@JsonIgnore
	private PostBean post;

	@Id
	@Column(name = "likeid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer likeid;

	@Column(name = "count")
	private Integer count;

	

	public Integer getCount() {
		return count;
	}


	public void setCount(Integer count) {
		this.count = count;
	}




	public PostBean getPost() {
		return post;
	}


	public void setPost(PostBean post) {
		this.post = post;
	}


	public Integer getLikeid() {
		return likeid;
	}


	public void setLikeid(Integer likeid) {
		this.likeid = likeid;
	} 

	
	
}
