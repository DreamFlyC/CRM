package com.lw.crm.crmstockinoroutlog.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmstockinoroutlog.entity.CrmStockInorOutLog;
import com.lw.crm.crmstockinoroutlog.persistence.CrmStockInorOutLogMapper;
import com.lw.crm.crmstockinoroutlog.service.ICrmStockInorOutLogService;
import com.lw.crm.crmstockinoroutlogitem.persistence.CrmStockInorOutLogItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("CrmStockInorOutLogServiceImpl")
@Transactional
public class CrmStockInorOutLogServiceImpl extends BaseServiceImpl<CrmStockInorOutLog> implements ICrmStockInorOutLogService{
	@Autowired
	private CrmStockInorOutLogMapper crmStockInorOutLogMapper;
	@Autowired
	private CrmStockInorOutLogItemMapper crmStockInorOutLogItemMapper;	

	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	@Override
	public int delete(int id) {
		CrmStockInorOutLog obj=crmStockInorOutLogMapper.getById(id);
		String number=obj.getNumber();
		crmStockInorOutLogItemMapper.delByNumber(number);
		int result=crmStockInorOutLogMapper.delById(id);
		return result;
	}
	
	/*
	 * create by: CZP
	 * description:统计
	 * create time: 10:39 2018/11/30
	 * @return 
	 */
	@Override
	public List<CrmStockInorOutLog> getStatisticsByType(Map<String, Object> map){
		return crmStockInorOutLogMapper.getStatisticsByType(map);
	}
}
