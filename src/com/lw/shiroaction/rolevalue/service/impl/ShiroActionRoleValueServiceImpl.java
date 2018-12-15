package com.lw.shiroaction.rolevalue.service.impl;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.lw.core.base.persistence.BaseMapper;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.shiroaction.rolevalue.entity.ShiroActionRoleValue;
import com.lw.shiroaction.rolevalue.persistence.ShiroActionRoleValueMapper;
import com.lw.shiroaction.rolevalue.service.IShiroActionRoleValueService;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:31:18
*类说明
*/
@Service("ShiroActionRoleValueServiceImpl")
@Transactional
//@ActionModel(description="权限管理")
public class ShiroActionRoleValueServiceImpl extends BaseServiceImpl<ShiroActionRoleValue> implements IShiroActionRoleValueService{
	
	@Autowired
	private ShiroActionRoleValueMapper shiroActionRoleValueMapper;
	
	@Override
	public int delByUsersId(int id) {
		
        return shiroActionRoleValueMapper.delByUsersId(id);
	}

}
