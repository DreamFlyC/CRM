package com.lw.duty.service.impl;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.duty.entity.DutyLog;
import com.lw.duty.persistence.DutyLogMapper;
import com.lw.duty.service.IDutyLogService;


@Service("DutyLogServiceImpl")
@Transactional
public class DutyLogServiceImpl extends BaseServiceImpl<DutyLog> implements IDutyLogService{
  
	@Autowired
	private DutyLogMapper dutyLogMapper;
	
	public DutyLog getAll(int dutyid){
		
		return dutyLogMapper.getAll(dutyid);
	}
	
	public DutyLog get(Map param){
		return dutyLogMapper.getById(param);
	}
	
	public DutyLog getLast(@Param("uid")int userid) {
		return dutyLogMapper.getLast(userid);
	}
}
