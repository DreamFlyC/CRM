package com.lw.crm.crmstockinoroutlogitem.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;

import java.util.List;
import java.util.Map;

public interface CrmStockInorOutLogItemMapper extends BaseMapper<CrmStockInorOutLogItem>{

	public int delByNumber(String number);

    List<CrmStockInorOutLogItem> getStatisticsByType(Map<String, Object> map);
}
