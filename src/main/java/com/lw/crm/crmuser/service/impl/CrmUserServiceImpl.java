package com.lw.crm.crmuser.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmuser.entity.CrmUser;
import com.lw.crm.crmuser.persistence.CrmUserMapper;
import com.lw.crm.crmuser.service.ICrmUserService;

@Service("CrmUserServiceImpl")
@Transactional
public class CrmUserServiceImpl extends BaseServiceImpl<CrmUser> implements ICrmUserService{
@Autowired
private CrmUserMapper crmUserMapper;
}
