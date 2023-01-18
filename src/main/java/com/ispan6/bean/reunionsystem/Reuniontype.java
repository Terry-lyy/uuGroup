package com.ispan6.bean.reunionsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reuniontype")
public class Reuniontype {
  //付聚會類型
	@Id
	@Column(name="reutid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reutid ;
	
	
	@Column(name="reutype", columnDefinition = "nvarchar(50)")
	private String reutype;
	
	public Integer getReutid() {
		return reutid;
	}


	public void setReutid(Integer reutid) {
		this.reutid = reutid;
	}


	public String getReutype() {
		return reutype;
	}


	public void setReutype(String reutype) {
		this.reutype = reutype;
	}



	
//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "reunion_type",cascade=CascadeType.ALL)
//	private List<reunion> reunion;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
