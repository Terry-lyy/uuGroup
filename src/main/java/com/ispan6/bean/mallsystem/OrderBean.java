package com.ispan6.bean.mallsystem;

import java.util.ArrayList;
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
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "orders")
public class OrderBean {

	@Id
	@Column(name = "o_id")
	private Integer id;
	
	@Column(name = "o_date")
	@Temporal(TemporalType.TIMESTAMP) //sql上顯示
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") //java上顯示
	@JsonFormat(pattern = "yyyy/MM/dd")  //瀏覽器上顯示
	private Date date;
	
	@Column(name = "o_count")
	private Integer count;
	
	@Column(name = "o_price")
	private Double price;
	
	@Column(name = "o_addr")
	private String addr;
	
	@Column(name = "o_email")
	private String mail;
	
	@Column(name = "o_tel")
	private String tel;
	
	@Column(name = "o_name")
	private String name;
	
	@Column(name = "o_status")
	private Integer status;
	
	@Column(name = "o_memberid")
	private Integer memberId;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "orderBean",cascade = CascadeType.ALL)
	private List<OrderItems> orderItems = new ArrayList<OrderItems>();

	@PrePersist
	public void prePersist() {
		if(date == null) {
			date = new Date();
		}
		if(status == null) {
			status = 0;
		}
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public List<OrderItems> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItems> orderItems) {
		this.orderItems = orderItems;
	}
	
	
	
}
