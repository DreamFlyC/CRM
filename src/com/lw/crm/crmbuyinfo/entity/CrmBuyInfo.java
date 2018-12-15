package com.lw.crm.crmbuyinfo.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.lw.crm.crmproduct.entity.CrmProduct;
import com.lw.crm.crmstock.entity.CrmStock;

@SuppressWarnings("serial")
public class CrmBuyInfo implements Serializable{
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
	private String leavstock;
	private String stocknum;
	private CrmStock crmStock;
	private CrmProduct crmProduct;
	
	
	
	public CrmProduct getCrmProduct() {
		return crmProduct;
	}
	public void setCrmProduct(CrmProduct crmProduct) {
		this.crmProduct = crmProduct;
	}
	public CrmStock getCrmStock() {
		return crmStock;
	}
	public void setCrmStock(CrmStock crmStock) {
		this.crmStock = crmStock;
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
	public String getLeavstock() {
		return leavstock;
	}
	public void setLeavstock(String leavstock) {
		this.leavstock = leavstock;
	}
	public String getStocknum() {
		return stocknum;
	}
	public void setStocknum(String stocknum) {
		this.stocknum = stocknum;
	}
	
	

}
