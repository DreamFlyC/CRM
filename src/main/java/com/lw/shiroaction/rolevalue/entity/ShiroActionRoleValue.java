package com.lw.shiroaction.rolevalue.entity;

import java.io.Serializable;
import java.util.List;

import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;



/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:30:30
*类说明
*/
public class ShiroActionRoleValue implements Serializable{
	private int id;
	private String name;
	private int  action_model_id;
	private	String action_type;
	private String action_url;
	private int action_users_group_id;
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
	public int getAction_model_id() {
		return action_model_id;
	}
	public void setAction_model_id(int action_model_id) {
		this.action_model_id = action_model_id;
	}
	public String getAction_type() {
		return action_type;
	}
	public void setAction_type(String action_type) {
		this.action_type = action_type;
	}
	public String getAction_url() {
		return action_url;
	}
	public void setAction_url(String action_url) {
		this.action_url = action_url;
	}
	public int getAction_users_group_id() {
		return action_users_group_id;
	}
	public void setAction_users_group_id(int action_users_group_id) {
		this.action_users_group_id = action_users_group_id;
	}
	
}
