package com.lw.crm.crmuser.entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CrmUser implements Serializable{
	private int id;
	private String user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}

}
