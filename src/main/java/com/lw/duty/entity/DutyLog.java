package com.lw.duty.entity;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class DutyLog implements Serializable{
	private int id; // id
	private int dutyid; // 任务ID
	private String content;// 任务内容
	private Integer progress; // 完成进度
	private String appendix;
	private String note; // 任务备注
	private Date date; // 时间
	private int uid; // 执行人id;
	private int duid; // 任务执行人ID对应任务dutyid
	private Duty duty;
	private DutyUsername dutyUsername;
	
	public DutyUsername getDutyUsername() {
		return dutyUsername;
	}
	public void setDutyUsername(DutyUsername dutyUsername) {
		this.dutyUsername = dutyUsername;
	}
	public Duty getDuty() {
		return duty;
	}
	public void setDuty(Duty duty) {
		this.duty = duty;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getProgress() {
		return progress;
	}
	public void setProgress(Integer progress) {
		this.progress = progress;
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
	public int getDuid() {
		return duid;
	}
	public void setDuid(int duid) {
		this.duid = duid;
	}
	/**
	 * @param uid2
	 */

}
