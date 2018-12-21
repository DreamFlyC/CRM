package com.lw.shiroaction.usersgroup.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:31:43
*类说明
*/
public class ShiroActionUsersGroup implements Serializable{
	private int id;
	private String name;
	private String remark;
	private int enable;
	private Date add_date;
	//private String action_model_count;//对应分组已设权限的总数
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
//	public String getAction_model_count() {
//		return action_model_count;
//	}
//	public void setAction_model_count(String action_model_count) {
//		this.action_model_count = action_model_count;
//	}
	

}
