package com.lw.crm.crmservicecustomer.entity;

import java.io.Serializable;
import java.util.Date;

public class CrmServiceCustomer implements Serializable{
	private int id;
	private String title;
	private String cid;  //公司id
	private String type; //
	private String uid;
	private String follow_uid;
	private String follow_purpose;
	private Date follow_datetime;
	private Date specified_datetiime;
	private String follow_result;
	private Date add_datetime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getFollow_uid() {
		return follow_uid;
	}
	public void setFollow_uid(String follow_uid) {
		this.follow_uid = follow_uid;
	}
	public String getFollow_purpose() {
		return follow_purpose;
	}
	public void setFollow_purpose(String follow_purpose) {
		this.follow_purpose = follow_purpose;
	}
	public Date getFollow_datetime() {
		return follow_datetime;
	}
	public void setFollow_datetime(Date follow_datetime) {
		this.follow_datetime = follow_datetime;
	}
	public Date getSpecified_datetiime() {
		return specified_datetiime;
	}
	public void setSpecified_datetiime(Date specified_datetiime) {
		this.specified_datetiime = specified_datetiime;
	}
	public String getFollow_result() {
		return follow_result;
	}
	public void setFollow_result(String follow_result) {
		this.follow_result = follow_result;
	}
	public Date getAdd_datetime() {
		return add_datetime;
	}
	public void setAdd_datetime(Date add_datetime) {
		this.add_datetime = add_datetime;
	}
	
	
}
