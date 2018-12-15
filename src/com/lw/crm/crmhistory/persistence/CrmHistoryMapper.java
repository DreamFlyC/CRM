package com.lw.crm.crmhistory.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmhistory.entity.CrmHistory;

public interface CrmHistoryMapper extends BaseMapper<CrmHistory>{
	
	public int getCount(int id);
	
}
