package com.lw.duty.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;

public class Duty implements Serializable{
	private int id;  //id
	private String number;   //任务编号
	private String title;   //任务名称
	private String user;   //执行人
	private Date startdate;//开始日期
	private Date enddate;  //结束日期
	private String content;//任务描述
	private String appendix;//附件名称
	private String note;  //备注
	private int dkey;  //状态
	private int ndkey; //反状态
 
	private Date date;    //操作日期
	private String uid;      //用户id 
	private DutyLog dutyLog; //任务进度
	private ArrayList<DutyUser> dutyUser;
	private DutyLog dutyLogList;
	private ArrayList<DutyDepart> dutyDepart;
	private int type;  //投诉问题类型
	private int level; //工单级别
	private String begintime; //开始任务时间
	private String stoptime; //完成任务时间
	private String stime; //开始任务时间
	private String etime; //完成任务时间
	private int[] ids;
	private String sdate;
	private String edate;
	private int total;
	private float sumProgress; //任务总进度
	private String days;
	private int count1;
	private int count2;
	private int count3;
	private int count4;
	private int count5;
	private int count6;
	private int count7;
	private int count8;
	private int count9;
	private int publisherid;//发布者publisherid
	private String usersgroupid;//接收工单的部门分组id
	private List<ShiroActionUsersGroup> usersgroupitemList;
	private String departId;
	
	
	
	public List<ShiroActionUsersGroup> getUsersgroupitemList() {
		return usersgroupitemList;
	}
	public void setUsersgroupitemList(List<ShiroActionUsersGroup> usersgroupitemList) {
		this.usersgroupitemList = usersgroupitemList;
	}
	public ArrayList<DutyDepart> getDutyDepart() {
		return dutyDepart;
	}
	public void setDutyDepart(ArrayList<DutyDepart> dutyDepart) {
		this.dutyDepart = dutyDepart;
	}
	public String getDepartId() {
		return departId;
	}
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	public float getSumProgress() {
		return sumProgress;
	}
	public void setSumProgress(float sumProgress) {
		this.sumProgress = sumProgress;
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
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
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
	public DutyLog getDutyLog() {
		return dutyLog;
	}
	public void setDutyLog(DutyLog dutyLog) {
		this.dutyLog = dutyLog;
	}
	public ArrayList<DutyUser> getDutyUser() {
		return dutyUser;
	}
	public void setDutyUser(ArrayList<DutyUser> dutyUser) {
		this.dutyUser = dutyUser;
	}
	public DutyLog getDutyLogList() {
		return dutyLogList;
	}
	public void setDutyLogList(DutyLog dutyLogList) {
		this.dutyLogList = dutyLogList;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public int getCount1() {
		return count1;
	}
	public void setCount1(int count1) {
		this.count1 = count1;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getCount3() {
		return count3;
	}
	public void setCount3(int count3) {
		this.count3 = count3;
	}
	public int getCount4() {
		return count4;
	}
	public void setCount4(int count4) {
		this.count4 = count4;
	}
	public int getCount5() {
		return count5;
	}
	public void setCount5(int count5) {
		this.count5 = count5;
	}
	public int getCount6() {
		return count6;
	}
	public void setCount6(int count6) {
		this.count6 = count6;
	}
	public int getCount7() {
		return count7;
	}
	public void setCount7(int count7) {
		this.count7 = count7;
	}
	public int getCount8() {
		return count8;
	}
	public void setCount8(int count8) {
		this.count8 = count8;
	}
	public int getCount9() {
		return count9;
	}
	public void setCount9(int count9) {
		this.count9 = count9;
	}
	public int getPublisherid() {
		return publisherid;
	}
	public void setPublisherid(int publisherid) {
		this.publisherid = publisherid;
	}
	public String getUsersgroupid() {
		return usersgroupid;
	}
	public void setUsersgroupid(String usersgroupid) {
		this.usersgroupid = usersgroupid;
	}
	/*public List<ShiroActionUsersGroup> getUsersgroupitemList() {
		return usersgroupitemList;
	}
	public void setUsersgroupitemList(List<ShiroActionUsersGroup> usersgroupitemList) {
		this.usersgroupitemList = usersgroupitemList;
	}*/
	
 
 
	
	

}