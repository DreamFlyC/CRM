package com.lw.shiroaction.usersgroup.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.service.IBaseService;
import com.lw.duty.entity.DutyUsername;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:31:58
*类说明
*/
public interface IShiroActionUsersGroupService extends IBaseService<ShiroActionUsersGroup>{

	
	public List<ShiroActionUsersGroup> getListByids(@Param("ids")Integer... ids);

	public List<ShiroActionUsersGroup> getListByGroupid(Map userGroupMap);
	


}
