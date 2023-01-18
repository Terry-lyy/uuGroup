package com.ispan6.bean.membersystem;

import javax.persistence.Id;

public class Demo2 {
//	
//	[id] [int] IDENTITY(1,1) NOT NULL,
//	[m_account] [nvarchar](50) NOT NULL,
//	[m_password] [nvarchar](50) NOT NULL

	@Id

	private Integer id;
	private String mAccount;
	private String mPassword;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
