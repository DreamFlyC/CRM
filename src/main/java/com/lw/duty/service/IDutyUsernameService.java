package com.lw.duty.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.service.IBaseService;
import com.lw.duty.entity.DutyUsername;

public interface IDutyUsernameService extends IBaseService<DutyUsername>{

	public List<DutyUsername> getAll();
	
	public void addUser(DutyUsername user);

	public DutyUsername getByName(String username);  
	
	public List<DutyUsername> getListByUsersGroupids(@Param("ids") Integer... ids);

	public List<DutyUsername> getListUsername(@Param("ids") Integer... ids);

	public List<DutyUsername> getByUser(String user);

	/**
	 * @Desc 
	 * @param ids
	 * @return
	 * @author CZP
	 * @Date 2018年10月18日 下午12:15:15
	 */
	public List<DutyUsername> getUsersGroupList(String ids);

}
