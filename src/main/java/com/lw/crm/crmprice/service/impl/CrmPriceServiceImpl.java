package com.lw.crm.crmprice.service.impl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmprice.entity.CrmPrice;
import com.lw.crm.crmprice.service.ICrmPriceService;
@Service("CrmPriceServiceImpl")
@Transactional
public class CrmPriceServiceImpl extends BaseServiceImpl<CrmPrice> implements ICrmPriceService {

}
