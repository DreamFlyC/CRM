package com.lw.crm.crmbusiness.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmbusiness.entity.CrmBusiness;
import com.lw.crm.crmbusiness.persistence.CrmBusinessMapper;
import com.lw.crm.crmbusiness.service.ICrmBusinessService;

@Service("CrmBusinessServiceImpl")
@Transactional
public class CrmBusinessServiceImpl extends BaseServiceImpl<CrmBusiness> implements ICrmBusinessService{
@Autowired
private CrmBusinessMapper crmBusinessMapper;
}
