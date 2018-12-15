package com.lw.duty.entity;

import java.io.Serializable;
import java.util.Date;

public class DutyUserLastTime implements Serializable{
	private Date lastTime;

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
	
	
}
