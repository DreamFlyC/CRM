package com.lw.duty.entity;

import java.io.Serializable;

public class DutyUsername implements Serializable{
	private int id;
	private String user;
	private String groupid;
	
	
	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
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
