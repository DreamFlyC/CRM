package com.lw.duty.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

/**
* 
*
* @author CZP
*/
@SuppressWarnings("serial")
public class DutyUser implements Serializable{
	private int id; // id
	private int dutyid; // dutyid 对应duty.java的id
	private int userid; // 执行人 对应duty的Uid
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startdate;// 开始日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date enddate; // 结束日期
	private String content;// 任务描述
	private String appendix;// 附件名称
	private String note; // 备注
	private int dkey; // 状态
	private String sdate;
	private String edate;
	private String begintime;
	private String stoptime;
	private DutyLog dutyLog;
	private DutyUsername dutyUsername;
	private Duty duty;
	private List<DutyLog> dutyLogList;
	private Date lastTime;
	

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public List<DutyLog> getDutyLogList() {
		return dutyLogList;
	}

	public void setDutyLogList(List<DutyLog> dutyLogList) {
		this.dutyLogList = dutyLogList;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getStoptime() {
		return stoptime;
	}

	public void setStoptime(String stoptime) {
		this.stoptime = stoptime;
	}

	public Duty getDuty() {
		return duty;
	}

	public void setDuty(Duty duty) {
		this.duty = duty;
	}

	public DutyUsername getDutyUsername() {
		return dutyUsername;
	}

	public void setDutyUsername(DutyUsername dutyUsername) {
		this.dutyUsername = dutyUsername;
	}

	public DutyLog getDutyLog() {
		return dutyLog;
	}

	public void setDutyLog(DutyLog dutyLog) {
		this.dutyLog = dutyLog;
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

	public int getDutyid() {
		return dutyid;
	}

	public void setDutyid(int dutyid) {
		this.dutyid = dutyid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAppendix() {
		return appendix;
	}

	public void setAppendix(String appendix) {
		this.appendix = appendix;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getDkey() {
		return dkey;
	}

	public void setDkey(int dkey) {
		this.dkey = dkey;
	}

}
