package com.lw.duty.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.duty.entity.DutyUsername;

public interface DutyUsernameMapper extends BaseMapper<DutyUsername>{
	public List<DutyUsername> getAll();

	/**
	 * @param string
	 * @return
	 */
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
	 * @Date 2018年10月18日 下午12:16:03
	 */
	public List<DutyUsername> getUsersGroupList(@Param("ids")String ids);
}
