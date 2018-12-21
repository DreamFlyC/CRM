package com.lw.crm.crm.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.lw.crm.crmbuyinfo.entity.CrmBuyInfo;
import com.lw.crm.crmstock.entity.CrmStock;

@SuppressWarnings("serial")
public class Crm implements Serializable{
	private int id;
	private String number;
	private String title;
	private double price;
	private int type;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date date;
	private int uid;
	private int stocknum;
	private int[] ids;
	private String sdate;
	private String edate;
	private CrmStock crmStock;
	private CrmBuyInfo crmBuyInfo;
	
	
	
	
	public int getStocknum() {
		return stocknum;
	}
	public void setStocknum(int stocknum) {
		this.stocknum = stocknum;
	}
	public CrmBuyInfo getCrmBuyInfo() {
		return crmBuyInfo;
	}
	public void setCrmBuyInfo(CrmBuyInfo crmBuyInfo) {
		this.crmBuyInfo = crmBuyInfo;
	}
	public CrmStock getCrmStock() {
		return crmStock;
	}
	public void setCrmStock(CrmStock crmStock) {
		this.crmStock = crmStock;
	}
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
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

	
	
}
