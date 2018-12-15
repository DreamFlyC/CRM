package com.lw.crm.crmhistory.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmhistory.entity.CrmHistory;
import com.lw.crm.crmhistory.persistence.CrmHistoryMapper;
import com.lw.crm.crmhistory.service.ICrmHistoryService;

@Service("CrmHistoryServiceImpl")
@Transactional
public class CrmHistoryServiceImpl extends BaseServiceImpl<CrmHistory> implements ICrmHistoryService{
@Autowired
private  CrmHistoryMapper crmHistoryMapper;

public int getCount(int id) {
	return crmHistoryMapper.getCount(id);
}

}
