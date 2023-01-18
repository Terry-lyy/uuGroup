package com.ispan6.bean.postsystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "comment")
public class CommentBean {
	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "memberId")
//	@JsonIgnore
//	private MemberTest member;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "postid")
	@JsonIgnore
	private PostBean post;
//
//	private Integer postId;
	
	@Id
	@Column(name = "commentid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentid; 

	@Column(name = "comments")
	private String comments;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "commentTime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	private Date commenttime;

	@PrePersist
	public void prePersist() {
		if (commenttime == null) {
			commenttime = new Date();
		}
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "memberId")
	@JsonIgnore
	private MemberTest memberId;

	public MemberTest getMemberId() {
		return memberId;
	}

	public void setMemberId(MemberTest memberId) {
		this.memberId = memberId;
	}

	public Integer getCommentid() {
		return commentid;
	}

	public void setCommentid(Integer commentid) {
		this.commentid = commentid;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(Date commenttime) {
		this.commenttime = commenttime;
	}

	public void setPost(PostBean post) {
		this.post = post;
	}

	public PostBean getPost() {
		return post;
	}

//	public Integer getPostId() {
//		return postId;
//	}
//
//	public void setPostId(Integer postId) {
//		this.postId = postId;
//	}

	
}
