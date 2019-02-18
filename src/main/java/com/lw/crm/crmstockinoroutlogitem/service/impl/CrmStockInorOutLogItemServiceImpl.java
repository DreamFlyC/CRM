package com.lw.crm.crmstockinoroutlogitem.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;
import com.lw.crm.crmstockinoroutlogitem.persistence.CrmStockInorOutLogItemMapper;
import com.lw.crm.crmstockinoroutlogitem.service.ICrmStockInorOutLogItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("CrmStockInorOutLogItemServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class CrmStockInorOutLogItemServiceImpl extends BaseServiceImpl<CrmStockInorOutLogItem> implements ICrmStockInorOutLogItemService{
	@Autowired
	private CrmStockInorOutLogItemMapper crmStockInorOutLogItemMapper;

	@Override
	public int delByNumber(String number) {
		return crmStockInorOutLogItemMapper.delByNumber(number);
	}

	@Override
	public List<CrmStockInorOutLogItem> getStatisticsByType(Map<String, Object> map){
		return crmStockInorOutLogItemMapper.getStatisticsByType(map);
	}
}
