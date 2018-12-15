package com.lw.shiroaction.rolevalue.service;

import com.lw.core.base.service.IBaseService;
import com.lw.shiroaction.rolevalue.entity.ShiroActionRoleValue;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:31:01
*类说明
*/
public interface IShiroActionRoleValueService extends IBaseService<ShiroActionRoleValue>{
	public abstract int delByUsersId(int id);
}
