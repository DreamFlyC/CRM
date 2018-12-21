package com.lw.shiroaction.model.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.shiroaction.model.entity.ShiroActionModel;
import com.lw.shiroaction.model.service.IShiroActionModelService;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:27:11
*类说明
*/
@Service("ShiroActionModelServiceImpl")
@Transactional
//@ActionModel(description="模块管理")
public class ShiroActionModelServiceImpl extends BaseServiceImpl<ShiroActionModel> implements IShiroActionModelService{


}
