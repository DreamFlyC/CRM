package com.lw.crm.crmstock.entity;

import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmsupplier.entity.CrmSupplier;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class CrmStock implements Serializable{
	private int id;     //库存id
	private String stocknum;  //库存总量
	private int pid;   //产品id
	private String unit; //计量单位
	private int type;  //产品类型
	private String number;//产品编号
	private Date date;  //添加时间
	private int uid;   //用户id
	private double price;
	private String title;
	private int sid;   //供应商id
	private int seq; //序号
	private String snumber; //供应商商品number
	private int stock_info_id;

	private CrmName crmName;
	private CrmSupplier crmSupplier;

    public int getStock_info_id() {
        return stock_info_id;
    }

    public void setStock_info_id(int stock_info_id) {
        this.stock_info_id = stock_info_id;
    }
	public CrmSupplier getCrmSupplier() {
		return crmSupplier;
	}
	public void setCrmSupplier(CrmSupplier crmSupplier) {
		this.crmSupplier = crmSupplier;
	}
	public String getSnumber() {
		return snumber;
	}
	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public CrmName getCrmName() {
		return crmName;
	}
	public void setCrmName(CrmName crmName) {
		this.crmName = crmName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStocknum() {
		return stocknum;
	}
	public void setStocknum(String stocknum) {
		this.stocknum = stocknum;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
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

	@Override
	public String toString() {
		return "CrmStock{" +
				"id=" + id +
				", stocknum='" + stocknum + '\'' +
				", pid=" + pid +
				", unit='" + unit + '\'' +
				", type=" + type +
				", number='" + number + '\'' +
				", date=" + date +
				", uid=" + uid +
				", price=" + price +
				", title='" + title + '\'' +
				", sid=" + sid +
				", seq=" + seq +
				", snumber='" + snumber + '\'' +
				", stock_info_id=" + stock_info_id +
				", crmName=" + crmName +
				", crmSupplier=" + crmSupplier +
				'}';
	}
}
