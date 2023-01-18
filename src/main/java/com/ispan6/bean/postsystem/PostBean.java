package com.ispan6.bean.postsystem;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "post")
public class PostBean {

	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
	private List<CommentBean> commentList;
	

	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
	private List<LikepostBean> likepostList;

	@Id
	@Column(name = "postid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postid;

	@Column(name = "content", columnDefinition = "nvarchar(500)")
	private String content;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "memberId")
	@JsonIgnore
	private MemberTest memberId;

	@Column(name = "picture")
	private byte[] picture;

	public MemberTest getMemberId() {
		return memberId;
	}

	public void setMemberId(MemberTest memberId) {
		this.memberId = memberId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "postTime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	private Date posttime;

	@PrePersist
	public void prePersist() {
		if (posttime == null) {
			posttime = new Date();
		}
	}

	public PostBean() {

	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPosttime() {
		return posttime;
	}

	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}

	public List<CommentBean> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentBean> commentList) {
		this.commentList = commentList;
	}

	public List<LikepostBean> getLikepostList() {
		return likepostList;
	}

	public void setLikepostList(List<LikepostBean> likepostList) {
		this.likepostList = likepostList;
	}

	

}
