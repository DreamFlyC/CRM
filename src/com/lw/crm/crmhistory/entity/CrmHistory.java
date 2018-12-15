package com.lw.crm.crmhistory.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.lw.crm.crmbuyinfo.entity.CrmBuyInfo;

@SuppressWarnings("serial")
public class CrmHistory implements Serializable{
	private int id;
	private String number;
	private String title;
	private double price;
	private int type;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date date;
	private int uid;
	private int pid;
	private String stock;
	private String address;
	private String note;
	private CrmBuyInfo crmBuyInfo;
	
	
	public CrmBuyInfo getCrmBuyInfo() {
		return crmBuyInfo;
	}
	public void setCrmBuyInfo(CrmBuyInfo crmBuyInfo) {
		this.crmBuyInfo = crmBuyInfo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}

}
