package com.lw.duty.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.duty.entity.DutyUsername;
import com.lw.duty.persistence.DutyUsernameMapper;
import com.lw.duty.service.IDutyUsernameService;


@Service("DutyUsernameServiceImpl")
@Transactional
public class DutyUsernameServiceImpl extends BaseServiceImpl<DutyUsername> implements IDutyUsernameService{
	@Autowired
	private DutyUsernameMapper dutyUsernameMapper;
	
	
	public List<DutyUsername> getAll(){
		return dutyUsernameMapper.getAll();
	}
	
	public void addUser(DutyUsername user) {
		  dutyUsernameMapper.addUser(user);
	}
	
	public DutyUsername getByName(@Param("username")String username) {
		return dutyUsernameMapper.getByName(username);
	}
	
	public List<DutyUsername> getListByUsersGroupids(@Param("ids") Integer... ids){
		return dutyUsernameMapper.getListByUsersGroupids(ids);
	}
	public List<DutyUsername> getListUsername(@Param("ids") Integer... ids){
		return dutyUsernameMapper.getListUsername(ids);
	}
	
	public List<DutyUsername> getByUser(String user){
		return dutyUsernameMapper.getByUser(user);
	}
	
	public List<DutyUsername> getUsersGroupList(String ids){
		return dutyUsernameMapper.getUsersGroupList(ids);
	}
}
