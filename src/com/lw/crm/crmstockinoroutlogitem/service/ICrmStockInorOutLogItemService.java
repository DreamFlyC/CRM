package com.lw.crm.crmstockinoroutlogitem.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;

import java.util.List;
import java.util.Map;

public interface ICrmStockInorOutLogItemService extends IBaseService<CrmStockInorOutLogItem>{

	public int delByNumber(String number);


    List<CrmStockInorOutLogItem> getStatisticsByType(Map<String, Object> map);
}
