package com.lw.weixin.users.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体类
 * @author 胡礼波-Andy
 * @2014年11月10日上午9:38:53
 *
 */
public class Users implements Serializable{

	/**
	 * @author 胡礼波-Andy
	 * @2014年11月10日上午9:39:06
	 * 
	 */
	private static final long serialVersionUID = 2985559170913083284L;

	private int id;
	private String name;			//姓名
	private String email;			//邮箱
	private String userName;		//用户名
	private String password;		//密码
	private boolean enable;			//帐号是否启用
	private String salt;			//密钥盐
	private Date registeDate;		//注册时间
	private String registIp;		//注册IP
	private Date lastLoginDate;		//最后一次登录时间
	private String lastLoginIp;		//最后一次登录IP
	private int groupid;//1为超级管理员　2技术部    3客服运营 　4 市场部　5财务部   6总经办
	private int is_director;//1为部门主管
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public String getRegistIp() {
		return registIp;
	}

	public void setRegistIp(String registIp) {
		this.registIp = registIp;
	}

	public Date getRegistDate() {
		return registeDate;
	}

	public void setRegistDate(Date registeDate) {
		this.registeDate = registeDate;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGroupid() {
		return groupid;
	}

	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}

	public int getIs_director() {
		return is_director;
	}

	public void setIs_director(int is_director) {
		this.is_director = is_director;
	}
}
