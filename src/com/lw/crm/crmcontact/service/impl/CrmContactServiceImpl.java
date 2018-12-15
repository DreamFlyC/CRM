package com.lw.crm.crmcontact.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmcontact.entity.CrmContact;
import com.lw.crm.crmcontact.service.ICrmContactService;

@Service("CrmContactServiceImpl")
@Transactional
public class CrmContactServiceImpl extends BaseServiceImpl<CrmContact> implements ICrmContactService{

}
