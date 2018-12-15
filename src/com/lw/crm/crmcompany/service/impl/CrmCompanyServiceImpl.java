package com.lw.crm.crmcompany.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmcompany.entity.CrmCompany;
import com.lw.crm.crmcompany.service.ICrmCompanyService;

@Service("CrmCompanyServiceImpl")
@Transactional
public class CrmCompanyServiceImpl extends BaseServiceImpl<CrmCompany> implements ICrmCompanyService{

}
