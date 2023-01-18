package com.ispan6.bean.mallsystem;

import java.util.HashSet;
import java.util.Set;

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
import javax.persistence.Table;

@Entity
@Table(name = "product_type")
public class ProductType {

	@Id
	@Column(name = "pt_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name ="pt_type")
	private String type;


//	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "type")
//
//	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "p_type")
//	private Set<Product> products = new HashSet<Product>();
	
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