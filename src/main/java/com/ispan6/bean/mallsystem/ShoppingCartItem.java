package com.ispan6.bean.mallsystem;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.springframework.stereotype.Component;

import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "shoppingcartitem")
@Component
public class ShoppingCartItem {
	
	@Id
	@Column(name = "sci_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

	@OneToOne
    @JoinColumn(name="sci_pid", referencedColumnName="p_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "sci_mid")
    private MemberTest memberTest;
    
    @Column(name = "sci_count")
    private Integer count;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public MemberTest getMemberTest() {
		return memberTest;
	}

	public void setMemberTest(MemberTest memberTest) {
		this.memberTest = memberTest;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
    
    
	
}
