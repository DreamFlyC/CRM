package com.lw.shiroaction.usersgroup.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.shiroaction.model.entity.ShiroActionModel;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:31:50
*类说明
*/
public interface ShiroActionUsersGroupMapper extends BaseMapper<ShiroActionUsersGroup>{
	
	public List<ShiroActionUsersGroup> getListByids(@Param("ids")Integer... ids);

	public List<ShiroActionUsersGroup> getListByGroupid(Map userGroupMap);
	
	
}
