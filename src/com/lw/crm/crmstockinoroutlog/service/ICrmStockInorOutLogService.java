package com.lw.crm.crmstockinoroutlog.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmstockinoroutlog.entity.CrmStockInorOutLog;

import java.util.List;
import java.util.Map;

public interface ICrmStockInorOutLogService extends IBaseService<CrmStockInorOutLog>{


	public int delete(int id);

    List<CrmStockInorOutLog> getStatisticsByType(Map<String, Object> map);
}
