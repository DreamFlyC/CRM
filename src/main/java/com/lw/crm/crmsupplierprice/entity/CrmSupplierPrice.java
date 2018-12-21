package com.lw.crm.crmsupplierprice.entity;

import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmunit.entity.CrmUnit;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@SuppressWarnings("serial")
public class CrmSupplierPrice implements Serializable{
	private int id;     //库存id
	private BigDecimal price;
	private int type;  //产品类型
	private String name;   //产品id
	private Date date;  //添加时间
	private String uid;
	private int sid;   //供应商id
	private String snumber; //供应商商品number
	private String unit; //计量单位
	private int seq; //序号
	private CrmUnit crmUnit;
	private CrmName crmName;
	private CrmSupplier crmSupplier;

	public CrmUnit getCrmUnit() {
		return crmUnit;
	}

	public void setCrmUnit(CrmUnit crmUnit) {
		this.crmUnit = crmUnit;
	}

	public CrmName getCrmName() {
		return crmName;
	}

	public void setCrmName(CrmName crmName) {
		this.crmName = crmName;
	}

	public CrmSupplier getCrmSupplier() {
		return crmSupplier;
	}

	public void setCrmSupplier(CrmSupplier crmSupplier) {
		this.crmSupplier = crmSupplier;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
}
