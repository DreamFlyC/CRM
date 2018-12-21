package com.lw.crm.crmstockinoroutlog.entity;

import java.io.Serializable;
import java.util.Date;

import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmstocktype.entity.CrmStockType;

public class CrmStockInorOutLog implements Serializable{
	private int id;
	private String number;
	private String title;
	private String price;
	private String type;
	private Date date;
	private String uid;
	private String takeuid;
	private String note;
	private String address;
	private CrmName crmName;
	private CrmStockType crmStockType;
	
	
	public CrmStockType getCrmStockType() {
		return crmStockType;
	}
	public void setCrmStockType(CrmStockType crmStockType) {
		this.crmStockType = crmStockType;
	}
	public CrmName getCrmName() {
		return crmName;
	}
	public void setCrmName(CrmName crmName) {
		this.crmName = crmName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getTakeuid() {
		return takeuid;
	}
	public void setTakeuid(String takeuid) {
		this.takeuid = takeuid;
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
	
	

}
