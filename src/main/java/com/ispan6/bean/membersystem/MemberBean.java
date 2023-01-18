package com.ispan6.bean.membersystem;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;

@Entity
@Table(name = "member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

//	
//	[id] [int] IDENTITY(1,1) NOT NULL,
//	[m_account] [nvarchar](50) NOT NULL,
//	[m_password] [nvarchar](50) NOT NULL

	@Id
	@Column(name = "MEMBERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mid;
	@Column(name = "maccount")
	private String mAccount;
	@Column(name = "mpassword")
	private String mPassword;

	
	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getId() {
		return mid;
	}

	public void setId(Integer id) {
		this.mid = id;
	}

	public String getmAccount() {
		return mAccount;
	}

	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	

}
