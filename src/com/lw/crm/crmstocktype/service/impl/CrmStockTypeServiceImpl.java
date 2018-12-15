package com.lw.crm.crmstocktype.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmstocktype.entity.CrmStockType;
import com.lw.crm.crmstocktype.persistence.CrmStockTypeMapper;
import com.lw.crm.crmstocktype.service.ICrmStockTypeService;

@Service("CrmStockTypeServiceImpl")
@Transactional
public class CrmStockTypeServiceImpl extends BaseServiceImpl<CrmStockType> implements ICrmStockTypeService{

	@Autowired
	private CrmStockTypeMapper crmStockTypeMapper;
}
