package com.lw.duty.persistence;

import java.util.List;
import java.util.Map;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.duty.entity.DutyLog;


public interface DutyLogMapper extends BaseMapper<DutyLog>{
	public DutyLog getAll(int dutyid);
	
	public DutyLog getById(Map param);
	
	public DutyLog getLast(int userid);
	
}
