package com.lw.crm.crmstockinoroutlog.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmstockinoroutlog.entity.CrmStockInorOutLog;

import java.util.List;
import java.util.Map;

public interface CrmStockInorOutLogMapper extends BaseMapper<CrmStockInorOutLog>{
	public int delete(int id);

    List<CrmStockInorOutLog> getStatisticsByType(Map<String, Object> map);
}
