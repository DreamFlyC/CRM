package com.lw.shiroaction.usersgroup.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.shiroaction.model.persistence.ShiroActionModelMapper;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.persistence.ShiroActionUsersGroupMapper;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:32:19
*类说明
*/
@Service("ShiroActionUsersGroupServiceImpl")
@Transactional
//@ActionModel(description="角色管理")
public class ShiroActionUsersGroupServiceImpl extends BaseServiceImpl<ShiroActionUsersGroup> implements IShiroActionUsersGroupService{
	
	@Autowired
	private ShiroActionUsersGroupMapper shiroActionUsersGroupMapper;
	
	public List<ShiroActionUsersGroup> getListByids(@Param("ids")Integer... ids){
		return shiroActionUsersGroupMapper.getListByids(ids);
	}
	
	public List<ShiroActionUsersGroup> getListByGroupid(Map userGroupMap){
		return shiroActionUsersGroupMapper.getListByGroupid(userGroupMap);
	}
	
}
