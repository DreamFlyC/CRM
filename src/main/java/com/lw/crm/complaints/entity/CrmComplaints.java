package com.lw.crm.complaints.entity;
import com.lw.crm.complaintstype.entity.CrmComplaintsType;

import java.io.Serializable;
import java.util.Date;

public class CrmComplaints implements Serializable {
     private int id;
     private String title;
     private String cid;
     private String number;
     private String user;
     private String comdate;
     private String type;
     private Date date;
     private String uid;
     private String stime;
     private String etime;
     private int num;
     private CrmComplaintsType ComplaintsName;

	public CrmComplaintsType getComplaintsName() {
		return ComplaintsName;
	}

	public void setComplaintsName(CrmComplaintsType complaintsName) {
		ComplaintsName = complaintsName;
	}

	public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    private CrmComplaintsType complaintsType;
	public CrmComplaintsType getComplaintsType() {
		return complaintsType;
	}
	public void setComplaintsType(CrmComplaintsType complaintsType) {
		this.complaintsType = complaintsType;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
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
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getComdate() {
		return comdate;
	}
	public void setComdate(String comdate) {
		this.comdate = comdate;
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
     
}
