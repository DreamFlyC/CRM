package com.lw.shiroaction.rolevalue.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.shiroaction.model.entity.ShiroActionModel;
import com.lw.shiroaction.rolevalue.entity.ShiroActionRoleValue;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:30:38
*类说明
*/
public interface ShiroActionRoleValueMapper extends BaseMapper<ShiroActionRoleValue>{
	public List<ShiroActionRoleValue> getByRoleValueId(@Param("id")String id);
	public abstract int delByUsersId(int id);
}
