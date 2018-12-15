package com.lw.shiroaction.model.entity;

import java.io.Serializable;
import java.util.List;

import com.lw.shiroaction.rolevalue.entity.ShiroActionRoleValue;



/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:25:34
*类说明
*/
public class ShiroActionModel implements Serializable{
	private int id;
	private String name;
	private String sys_model;
	private ShiroActionRoleValue shiroActionRoleValue;
	private List<ShiroActionRoleValue> rolevalueitemList;
	
	public ShiroActionRoleValue getShiroActionRoleValue() {
		return shiroActionRoleValue;
	}
	public void setShiroActionRoleValue(ShiroActionRoleValue shiroActionRoleValue) {
		this.shiroActionRoleValue = shiroActionRoleValue;
	}
	public List<ShiroActionRoleValue> getRolevalueitemList() {
		return rolevalueitemList;
	}
	public void setRolevalueitemList(List<ShiroActionRoleValue> rolevalueitemList) {
		this.rolevalueitemList = rolevalueitemList;
	}
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
	public String getSys_model() {
		return sys_model;
	}
	public void setSys_model(String sys_model) {
		this.sys_model = sys_model;
	}
	
}
