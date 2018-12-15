package com.lw.crm.crmservicecustomer.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmservicecustomer.entity.CrmServiceCustomer;
import com.lw.crm.crmservicecustomer.persistence.CrmServiceCustomerMapper;
import com.lw.crm.crmservicecustomer.service.ICrmServiceCustomerService;
import com.lw.duty.entity.DutyUsername;

@Service("CrmServiceCustomerServiceImpl")
@Transactional
public class CrmServiceCustomerServiceImpl extends BaseServiceImpl<CrmServiceCustomer> implements ICrmServiceCustomerService{
	@Autowired
	private CrmServiceCustomerMapper crmServiceCustomerMapper;
	public  List<DutyUsername> getListByUsersGroupids(@Param("ids") Integer... ids){
		return crmServiceCustomerMapper.getListByUsersGroupids(ids);
	}
}
