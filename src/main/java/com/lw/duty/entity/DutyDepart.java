/**
 * 
 */
package com.lw.duty.entity;

import java.io.Serializable;

/**
 * @author CZP
 */
public class DutyDepart implements Serializable{
	private int id;
	private String depart;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	
	

}
