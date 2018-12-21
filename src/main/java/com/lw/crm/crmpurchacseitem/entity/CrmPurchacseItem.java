package com.lw.crm.crmpurchacseitem.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
* @author 作者:qw
* @createDate 创建时间：2018年12月6日 上午10:34:12
*/
public class CrmPurchacseItem implements Serializable{
	private int id;
	private String number;
	private int num;
	private String sid;
	private String title;
	private String name;
	private Date date;
	private String uid;
	private BigDecimal price;
	private String note;
	private int type;
	private int stock_info_id;
	private String snumber;

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getStock_info_id() {
		return stock_info_id;
	}
	public void setStock_info_id(int stock_info_id) {
		this.stock_info_id = stock_info_id;
	}
	
}
