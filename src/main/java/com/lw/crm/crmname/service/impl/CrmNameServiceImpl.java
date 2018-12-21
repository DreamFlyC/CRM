package com.lw.crm.crmname.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.persistence.CrmNameMapper;
import com.lw.crm.crmname.service.ICrmNameService;

@Service("CrmNameServiceImpl")
@Transactional
public class CrmNameServiceImpl extends BaseServiceImpl<CrmName> implements ICrmNameService{
@Autowired
private CrmNameMapper crmNameMapper;

}
