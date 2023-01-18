package com.ispan6.bean.chatsystem;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="customerservicemessage")
public class CustomerServiceMessage implements Serializable{
	private static final long serialVersionUID = 1L;
	public CustomerServiceMessage() {
		
	}
	@Id
	@Column(name="CUSTOMERSERVICEMESSAGEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int customerServiceMessageId;
		
	
	@Column(name="FROMMESSAGETEXT")
	private String fromMessageText;
	
	@Column(name="TOMESSAGETEXT")
	private String toMessageText;

	public int getCustomerServiceMessageId() {
		return customerServiceMessageId;
	}

	public void setCustomerServiceMessageId(int customerServiceMessageId) {
		this.customerServiceMessageId = customerServiceMessageId;
	}

	public String getFromMessageText() {
		return fromMessageText;
	}

	public void setFromMessageText(String fromMessageText) {
		this.fromMessageText = fromMessageText;
	}

	public String getToMessageText() {
		return toMessageText;
	}

	public void setToMessageText(String toMessageText) {
		this.toMessageText = toMessageText;
	}
	
	
}
