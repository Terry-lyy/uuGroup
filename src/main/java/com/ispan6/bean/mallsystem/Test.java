package com.ispan6.bean.mallsystem;

import java.util.Date;

import javax.persistence.Entity;

public class Test {

	private Date date;
	private String name;
	private String desc;
	private Integer select;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Integer getSelect() {
		return select;
	}
	public void setSelect(Integer select) {
		this.select = select;
	}
	
	
}
