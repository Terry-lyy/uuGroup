package com.ispan6.bean.reunionsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment {

	//付款方式
	@Id
	@Column(name="payid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer payid ;
	
	
	@Column(name="paytype")
	private String paytype;

//	@OneToOne(fetch = FetchType.LAZY,mappedBy = "payment",cascade=CascadeType.ALL)
//	private List<reunion> reunion;
	
	
	public Integer getPayid() {
		return payid;
	}


	public void setPayid(Integer payid) {
		this.payid = payid;
	}


	public String getPaytype() {
		return paytype;
	}


	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
