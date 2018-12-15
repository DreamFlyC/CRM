package com.lw.crm.crmsupplier.service.impl;


import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.persistence.CrmSupplierMapper;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("CrmSupplierServiceImpl")
@Transactional
public class CrmSupplierServiceImpl extends BaseServiceImpl<CrmSupplier> implements ICrmSupplierService{
@Autowired
private CrmSupplierMapper crmSupplierMapper;

	@Override
	public List<CrmSupplier> getIdBySupplier(String supplier) {
		return crmSupplierMapper.getIdBySupplier(supplier);
	}
}