package com.lw.crm.crmreceipttype.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmreceipttype.entity.CrmReceiptType;
import com.lw.crm.crmreceipttype.persistence.CrmReceiptTypeMapper;
import com.lw.crm.crmreceipttype.service.ICrmReceiptTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("CrmReceiptTypeServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class CrmReceiptTypeServiceImpl extends BaseServiceImpl<CrmReceiptType> implements ICrmReceiptTypeService {

    @Autowired
    private CrmReceiptTypeMapper crmReceiptTypeMapper;
	
}
