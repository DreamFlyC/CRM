package com.lw.crm.complaintstype.entity;
import java.io.Serializable;
import java.util.Date;

public class CrmComplaintsType implements Serializable{
	private int id;
	private String name;
	private Date adddatetime;
	private String uid;
	private String remark;
	private int seq;
	private String type;
	public void setType(String type) {
		this.type = type;
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
	public Date getAdddatetime() {
		return adddatetime;
	}
	public void setAdddatetime(Date adddatetime) {
		this.adddatetime = adddatetime;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getType() {
		return type;
	}
}
