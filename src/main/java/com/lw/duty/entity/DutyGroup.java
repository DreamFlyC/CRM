/**
 * 
 */
package com.lw.duty.entity;

import java.io.Serializable;

/**
 * @author CZP
 *
 * 2018年7月31日
 */
public class DutyGroup implements Serializable{
	private int id;
	private int dutyid;
	private int groupid;
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
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	
	
}
