package com.lw.crm.crmreceipttype.entity;

import java.io.Serializable;
import java.util.Date;

public class CrmReceiptType implements Serializable{
	private int id;
	private String name;
	private String uid;
	private String remark;
	private int seq;
	private Date add_datetime;

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

	public Date getAdd_datetime() {
		return add_datetime;
	}

	public void setAdd_datetime(Date add_datetime) {
		this.add_datetime = add_datetime;
	}
}
