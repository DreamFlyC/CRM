package com.lw.crm.crmunit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmunit.entity.CrmUnit;
import com.lw.crm.crmunit.persistence.CrmUnitMapper;
import com.lw.crm.crmunit.service.ICrmUnitService;

@Service("CrmUnitServiceImpl")
@Transactional
public class CrmUnitServiceImpl extends BaseServiceImpl<CrmUnit> implements ICrmUnitService{
@Autowired
private CrmUnitMapper crmUnitMapper;
}
