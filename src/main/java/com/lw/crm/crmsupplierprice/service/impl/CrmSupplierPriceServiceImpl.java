package com.lw.crm.crmsupplierprice.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmsupplierprice.entity.CrmSupplierPrice;
import com.lw.crm.crmsupplierprice.service.ICrmSupplierPriceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("CrmSupplierPriceServiceImpl")
@Transactional(rollbackFor = {Exception.class})
public class CrmSupplierPriceServiceImpl extends BaseServiceImpl<CrmSupplierPrice> implements ICrmSupplierPriceService {

}
