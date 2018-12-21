package com.lw.crm.crmpayment.service.impl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmpayment.entity.CrmPayment;
import com.lw.crm.crmpayment.service.ICrmPaymentService;
@Service("CrmPaymentServiceImpl")
@Transactional
public class CrmPaymentServiceImpl extends BaseServiceImpl<CrmPayment> implements ICrmPaymentService  {
	
}
