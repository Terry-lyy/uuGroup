package com.ispan6.bean.matchsystem;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="hobbits")
public class HobbitBean {
//	
//	   hobbitid int PRIMARY KEY IDENTITY(1,1),
//	    hobbit_type [nvarchar](50) NOT NULL
	@Id
	@Column(name = "hobbitid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name ="hobbit_type")
	private String type;


	@OneToMany(mappedBy = "hobbitid",fetch = FetchType.LAZY)
	private List<SelfHobbitBean> hoobitid=new ArrayList<SelfHobbitBean>();

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
