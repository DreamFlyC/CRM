package com.lw.crm.crmservicecustomer.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmservicecustomer.entity.CrmServiceCustomer;
import com.lw.duty.entity.DutyUsername;

public interface CrmServiceCustomerMapper extends BaseMapper<CrmServiceCustomer>{
	public  List<DutyUsername> getListByUsersGroupids(@Param("ids") Integer... ids);

}
