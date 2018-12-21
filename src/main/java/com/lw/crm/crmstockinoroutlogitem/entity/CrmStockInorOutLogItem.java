package com.lw.crm.crmstockinoroutlogitem.entity;

import java.io.Serializable;
import java.util.Date;

import com.lw.crm.crmname.entity.CrmName;

public class CrmStockInorOutLogItem implements Serializable{
	private String id;
	private String number;
	private String title;
	private String price;
	private String type;
	private Date date;
	private String uid;
	private String num;
	private String pid;
	private String note;
	private String address;
	private String inoroutlogno;
	private CrmName crmName;
	
	
	public CrmName getCrmName() {
		return crmName;
	}
	public void setCrmName(CrmName crmName) {
		this.crmName = crmName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInoroutlogno() {
		return inoroutlogno;
	}
	public void setInoroutlogno(String inoroutlogno) {
		this.inoroutlogno = inoroutlogno;
	}
	
	
}
