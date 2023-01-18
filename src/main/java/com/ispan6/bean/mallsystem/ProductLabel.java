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
@Table(name = "product_label")
public class ProductLabel {

	@Id
	@Column(name = "pl_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "pl_label")
	private String label;

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "pl_label")
//	@JoinColumn(name = "p_label")  （表裡面的外鍵）
//	private Set<Product> products;
	
//	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "label") //對面怎麼我，透過label
//	private Set<Product> products = new HashSet<Product>();
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
}
